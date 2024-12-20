module ApplicationHelper
  def default_meta_tags
    {
      site: "hieroglitter",
      title: "hieroglitter",
      reverse: true,
      charset: "utf-8",
      description: "𓇋𓈖𓆑𓍯𓂋𓅓𓄿𓏏𓇋𓍯𓈖 𓋴𓎛𓄿𓂋𓇋𓈖𓎼 𓄿𓏤𓏤 𓆑𓍯𓂋 𓏤𓎛𓄿𓂋𓄿𓍯𓎛",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image"
      }
    }
  end

  def twitter_intent_url(post_id)
    "https://twitter.com/intent/tweet?text=%F0%93%8E%9B%F0%93%87%8B%F0%93%87%8B%F0%93%82%8B%F0%93%8D%AF%F0%93%8E%BC%F0%93%83%AD%F0%93%87%8B%F0%93%8F%8F%F0%93%8F%8F%F0%93%87%8B%F0%93%82%8B%20%F0%93%85%B1%F0%93%8D%AF%20%F0%93%8F%8F%F0%93%85%B1%F0%93%8E%A1%F0%93%84%BF%F0%93%8F%8F%F0%93%8F%8F%F0%93%87%8B%20%F0%93%85%93%F0%93%87%8B%F0%93%88%96%F0%93%88%96%F0%93%84%BF%F0%93%85%93%F0%93%8D%AF%20%F0%93%86%91%F0%93%84%BF%F0%93%82%8B%F0%93%84%BF%F0%93%8D%AF%F0%93%88%96%F0%93%87%8B%F0%93%88%96%F0%93%84%BF%F0%93%82%8B%F0%93%8D%AF%F0%93%85%B1%20%0ahttps%3A%2F%2Fhieroglitter-0a0ed1ebffda.herokuapp.com%2Fposts%3Fpost%3D#{post_id}"
  end
end
