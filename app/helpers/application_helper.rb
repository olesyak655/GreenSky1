module ApplicationHelper

    def sortable_users(column_name, column, title=nil)
        title = column_name
        css_class = column == sort_column_users ? "current #{sort_direction_users}" : nil
        direction_users = column == sort_column_users && sort_direction_users == "asc" ? "desc" : "asc"
        # link_to title, {:sort => column, :direction => direction}, {:class => css_class}
        link_to title, params.merge(:sort_users => column, :direction_users => direction_users, :page => nil), {:class => css_class}, {remote: true}
    end

    def sortable_admins(column_name, column, title=nil)
        title = column_name
        css_class = column == sort_column_admins ? "current #{sort_direction_admins}" : nil
        direction_admins = column == sort_column_admins && sort_direction_admins == "asc" ? "desc" : "asc"
        # link_to title, {:sort => column, :direction => direction}, {:class => css_class}
        link_to title, params.merge(:sort_admins => column, :direction_admins => direction_admins, :page => nil), {:class => css_class}, {remote: true}
    end

end
