class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
        "data": {
            "regulator": {
                "id": "146",
                "name": "CFTC",
                "regulatorType": "workflow",
                "slug": "cftc"
            }
        }
    }.to_json
    [status, headers, [body]]
  end
end


