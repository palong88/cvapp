json.extract! job, :id, :name, :description, :closing_date, :created_at, :updated_at
json.url job_url(job, format: :json)