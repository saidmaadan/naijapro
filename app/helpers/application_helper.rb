module ApplicationHelper
   
    # def resource_name
    #   :agent
    # end
    # helper_method :resource_name
   
    # def resource
    #   @resource ||= Agent.new
    # end
    # helper_method :resource
   
    # def devise_mapping
    #   @devise_mapping ||= Devise.mappings[:agent]
    # end
    # helper_method :devise_mapping
   
    # def resource_class
    #   Agent
    # end
    # helper_method :resource_class

    def inline_svg_tag filename, options={}
        file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
        #file = File.open(`https://inventive-labs.s3.amazonaws.com/img/svg/#{filename}`) { |file| raw file.read }
        # file = localFile || remoteFile
        #file = File.read("https://inventive-labs.s3.amazonaws.com/img/svg/#{filename}")
        doc = Nokogiri::HTML::DocumentFragment.parse file
        svg = doc.at_css 'svg'
        if options[:class].present?
            svg['class'] = options[:class]
        end
        doc.to_html.html_safe
    end
    
    def avatar_url(agent)
        if agent.avatar.attached?
            url_for(agent.avatar)
        # elsif agent.image?
        #     agent.image
        else
            ActionController::Base.helpers.asset_path('icon_default_avatar.png')
        end
    end 
end
