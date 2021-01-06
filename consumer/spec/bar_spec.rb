require 'faraday'
require 'pact/consumer/rspec'
require_relative 'pact_helper'


describe "BarClient", :pact => true do
  it "can retrieve a thing"  do
    bar_service.
      upon_receiving("a regulator request").with({
      method: :post,
      path: '/graphql',
      headers: {'Accept' => 'application/json'}
    }).
      will_respond_with({
      status: 200,
      headers: { 'Content-Type' => 'application/json' },

          "data": {
              "regulator": {
                  "id": "146",
                  "name": "CFTC",
                  "regulatorType": "workflow",
                  "slug": "cftc"
              }
          }


    })

    # This request would normally be performed some BarClient class,
    # but just use simple request for the purposes of this test
    bar_response = Faraday.post(bar_service.mock_service_base_url + "/graphql", nil, {'Accept' => 'application/json'})

    # This would normally be checking the results of some deserialisation process,
    # (eg. check for an array of Factory classes )
    # but just check the response code for the purposes of this test
#    expect(bar_response.body).to include("F")
  end
end
