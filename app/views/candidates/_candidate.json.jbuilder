json.extract! candidate, :id, :name, :score, :job_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)