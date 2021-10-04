module Api
  def self.get_accounts(connection_id)
    api = Saltedge.new(APP_ID, SECRET)
    url = "#{SALTEDGE_API}/accounts?connection_id=#{connection_id}"
    status, response = api.request(:get, url)

    { status: status, response: response }
  end

  def self.get_connections(customer_id)
    api = Saltedge.new(APP_ID, SECRET)
    url = "#{SALTEDGE_API}/connections?customer_id=#{customer_id}"
    status, response = api.request(:get, url)

    { status: status, response: response }
  end

  def self.post_customer(identifier)
    api = Saltedge.new(APP_ID, SECRET)
    url = "#{SALTEDGE_API}/customers"
    status, response = api.request(:post, url, { 'data' => { 'identifier' => identifier } })

    { status: status, response: response }
  end

  def self.get_transactios(connection_id, account_id)
    api = Saltedge.new(APP_ID, SECRET)
    url = "#{SALTEDGE_API}/transactions?connection_id=#{connection_id}&account_id=#{account_id}"
    status, response = api.request(:get, url)

    { status: status, response: response }
  end

  def self.get_pending_transactions(connection_id, account_id)
    api = Saltedge.new(APP_ID, SECRET)
    url = "#{SALTEDGE_API}/transactions/pending?connection_id=#{connection_id}&account_id=#{account_id}"
    status, response = api.request(:get, url)

    { status: status, response: response }
  end
end
