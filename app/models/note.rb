class Note
  NOTE_KEY = 'note'

  class << self
    def raw
      @markdown = Rails.cache.read(NOTE_KEY) || ""
    end

    def raw=(raw)
      Rails.cache.write(NOTE_KEY, raw)
      raw
    end

    def html
      markdown_options = %w/autolink no_intra_emphasis/
      renderer_options = %w/hard_wrap/
      markdown = Redcarpet::Markdown.new(
          Redcarpet::Render::HTML.new(Hash[renderer_options.map {|o| [o.to_sym, true]}]),
          Hash[markdown_options.map {|o| [o.to_sym, true]}])
      markdown.render(raw).html_safe
    end
  end
end