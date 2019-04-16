class SituationsController < InheritedResources::Base

  private

    def situation_params
      params.require(:situation).permit(:cta)
    end

end
