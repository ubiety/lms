module AssignmentsHelper
  def render_description(description)
    options = {autolink: true, tables: true, hard_wrap: true, no_intra_emphasis: true, fenced_code:true, gh_blockcode: true, underline: true}
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(description).html_safe
  end
end
