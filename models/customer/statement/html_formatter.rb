require 'erb'
require_relative 'base_formatter'

class Customer
  class Statement
    class HtmlFormatter < BaseFormatter
      private

      def title
        render_component(:title)
      end

      def body
        render_component(:rentals)
      end

      def footer
        render_component(:footer)
      end

      private

      def render_component(component)
        component_path = components_templates_paths_mapping[component]
        path = File.join(__dir__, component_path)
        html = File.read(path)

        ERB.new(html).result(binding)
      end

      def components_templates_paths_mapping
        {
          title:   'html_templates/title.html.erb',
          rentals: 'html_templates/rentals.html.erb',
          footer:  'html_templates/footer.html.erb'
        }
      end
    end
  end
end
