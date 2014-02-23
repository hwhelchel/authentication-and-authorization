describe User do

  before(:all) do
  end

  context "when signing up" do
    it 'requires a valid email' do
    end

    it 'requires presence of password' do
    end

    it 'hashes password' do
    end
  end

  context 'when logging in' do

    it 'checks email against stored email' do
    end

    it 'checks password against hashed password' do
    end

    it 'sets a session cookie' do
    end
  end

  context "when logging out" do
    it 'clears the session' do
    end
  end

end