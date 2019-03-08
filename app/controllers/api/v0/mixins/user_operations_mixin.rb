module Api
  module V0
    module Mixins
      module UserOperationsMixin
        def add_action
          action = ActionCreateService.new(params.require(:stage_id)).create(action_params)
          json_response(action, :created)
        end

        def fetch_actions_by_stage_id
          stage = Stage.find(params.require(:stage_id))
          json_response(stage.actions)
        end

        def fetch_action_by_id
          action = Action.find(params.require(:id))

          json_response(action)
        end

        def fetch_stage_by_id
          stage = Stage.find(params.require(:id))

          json_response(stage)
        end

        private

        def action_params
          params.permit(:operation, :processed_by, :comments)
        end
      end
    end
  end
end
