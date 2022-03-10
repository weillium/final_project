class Api::V1::ScoresController < Api::V1::GraphitiController
  def index
    scores = ScoreResource.all(params)
    respond_with(scores)
  end

  def show
    score = ScoreResource.find(params)
    respond_with(score)
  end

  def create
    score = ScoreResource.build(params)

    if score.save
      render jsonapi: score, status: :created
    else
      render jsonapi_errors: score
    end
  end

  def update
    score = ScoreResource.find(params)

    if score.update_attributes
      render jsonapi: score
    else
      render jsonapi_errors: score
    end
  end

  def destroy
    score = ScoreResource.find(params)

    if score.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: score
    end
  end
end
