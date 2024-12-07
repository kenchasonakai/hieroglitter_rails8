module ApplicationHelper
  def default_meta_tags
    {
      site: 'hieroglitter',
      title: 'hieroglitter',
      reverse: true,
      charset: 'utf-8',
      description: '𓇋𓈖𓆑𓍯𓂋𓅓𓄿𓏏𓇋𓍯𓈖 𓋴𓎛𓄿𓂋𓇋𓈖𓎼 𓄿𓏤𓏤 𓆑𓍯𓂋 𓏤𓎛𓄿𓂋𓄿𓍯𓎛',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: "summary_large_image"
      }
    }
  end
end
