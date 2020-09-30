module ApplicationHelper
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
