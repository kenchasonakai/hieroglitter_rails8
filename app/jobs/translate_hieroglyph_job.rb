class TranslateHieroglyphJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find_by(id: post_id)
    return unless post.present?
    return if post.translated_text.present?

    translate(post.body)
    post.update(translated_text: translate(post.body))
  end

  private

  def translate(hierogliph)
    client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openai, :api_key))
    response = client.chat(
      parameters: {
        model: "o3-mini",
        messages: [{ role: "user", content: prompt(hierogliph)}]
      }
    )
    translated_json = response.dig("choices", 0, "message", "content")
    JSON.parse(translated_json.gsub('```', '').gsub('json', '').gsub(/[\r\n]/,""))["most"]
  end

  def prompt(input)
    <<~PROMPT
      あなたはヒエログリフ翻訳システムです。以下のルールと対応表に従い、入力されたヒエログリフ列をアルファベット表記に変換してください。なお、各ヒエログリフシンボルは、対応表に基づいて候補となるアルファベットへ変換され、全組み合わせを生成した上で、意味が通りやすさ（例：英語または日本語としての自然さ、既知の固有名詞やブランド、一般的な表現との一致度など）により各候補にスコア付けを行います。そして、スコアの高い上位3件の候補を選定し、最も高い候補を "most"、2番目を "better"、3番目を "Good" として出力してください。
      【対応表】
      アルファベット:
      A 𓄿 1313F; B 𓃀 130C0; C 𓎡 133A1; D 𓂧 130A7; E 𓇋 131CB; F 𓆑 13191; G 𓎼 133BC; H 𓎛 1339B; I 𓇋 131CB; J 𓆓 13193; K 𓎡 133A1; L 𓃭 130ED; M 𓅓 13153; N 𓈖 13216; O 𓍯 1336F; P 𓏤 133E4; Q 𓏘 133D8; R 𓂋 1308B; S 𓋴 132F4; T 𓏏 133CF; U 𓅱 13171; V 𓆑 13191; W 𓅱 13171; X 𓎡𓋴 133A1 132F4; Y 𓇋 131CB; Z 𓊃 13283.
      【処理手順】
      1. 候補生成 - 入力された各ヒエログリフシンボルについて、上記対応表を参照し、対応するアルファベット候補リストを作成する（例: あるシンボルが "131CB" または "𓇋" に対応している場合、該当アルファベットは I、E、Y のいずれかとなる可能性がある）。
      2. 全組み合わせの生成 - 各位置の候補から全ての組み合わせ（可能な全変換パターン）を生成する。
      3. 評価とスコア付け - 生成した各候補パターンに対し、英語または日本語として意味が通りやすいか、既知の固有名詞やブランド（例: NEGICHAN、RUNTEQ）との類似性、一般的な表現（例: GOOD MORNING）との一致度などの観点でスコア付けを行う。
      4. 上位3件の出力 - スコアの最も高いものを "most"として出力する。
      【出力形式】
      出力は下記のJSON形式とし、余計な文章や説明は一切含めず、厳密なJSONのみを返してください:
      {
        "most": "最上位候補の変換結果"
      }.
      【既知の正解例】
      - ヒエログリフ: 𓈖𓇋𓎼𓇋𓎡𓎛𓄿𓈖 → 正解: "NEGICHAN";
      - ヒエログリフ: 𓂋𓅱𓈖𓏏𓇋𓏘 → 正解: "RUNTEQ";
      - ヒエログリフ: 𓎼𓍯𓍯𓂧 𓅓𓍯𓂋𓈖𓇋𓈖𓎼 → 正解: "GOOD MORNING".
      【入力例】
      （各行ごとに別々のヒエログリフ列が入力される場合、各入力に対して上記の処理を実行してください。例: 𓋴𓄿𓋴𓄿𓎡𓇋𓋴𓄿𓈖）。
      入力: #{input}
    PROMPT
  end
end
