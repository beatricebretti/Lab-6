module ApplicationHelper
    def active_class(controller_name)
        'active' if controller.controller_name.to_sym == controller_name
    end
end
