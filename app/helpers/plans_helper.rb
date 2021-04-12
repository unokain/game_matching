module PlansHelper
    def choose_new_or_edit
        if action_name == 'new' || action_name == 'create'
          confirm_plans_path
        elsif action_name == 'edit'
          plan_path
        end
    end
end
