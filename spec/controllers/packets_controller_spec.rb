require 'spec_helper'

describe PacketsController do

  def mock_packet(stubs={})
    @mock_packet ||= mock_model(Packet, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all packets as @packets" do
      Packet.stub(:all) { [mock_packet] }
      get :index
      assigns(:packets).should eq([mock_packet])
    end
  end

  describe "GET show" do
    it "assigns the requested packet as @packet" do
      Packet.stub(:find).with("37") { mock_packet }
      get :show, :id => "37"
      assigns(:packet).should be(mock_packet)
    end
  end

  describe "GET new" do
    it "assigns a new packet as @packet" do
      Packet.stub(:new) { mock_packet }
      get :new
      assigns(:packet).should be(mock_packet)
    end
  end

  describe "GET edit" do
    it "assigns the requested packet as @packet" do
      Packet.stub(:find).with("37") { mock_packet }
      get :edit, :id => "37"
      assigns(:packet).should be(mock_packet)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created packet as @packet" do
        Packet.stub(:new).with({'these' => 'params'}) { mock_packet(:save => true) }
        post :create, :packet => {'these' => 'params'}
        assigns(:packet).should be(mock_packet)
      end

      it "redirects to the created packet" do
        Packet.stub(:new) { mock_packet(:save => true) }
        post :create, :packet => {}
        response.should redirect_to(packet_url(mock_packet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved packet as @packet" do
        Packet.stub(:new).with({'these' => 'params'}) { mock_packet(:save => false) }
        post :create, :packet => {'these' => 'params'}
        assigns(:packet).should be(mock_packet)
      end

      it "re-renders the 'new' template" do
        Packet.stub(:new) { mock_packet(:save => false) }
        post :create, :packet => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested packet" do
        Packet.should_receive(:find).with("37") { mock_packet }
        mock_packet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :packet => {'these' => 'params'}
      end

      it "assigns the requested packet as @packet" do
        Packet.stub(:find) { mock_packet(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:packet).should be(mock_packet)
      end

      it "redirects to the packet" do
        Packet.stub(:find) { mock_packet(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(packet_url(mock_packet))
      end
    end

    describe "with invalid params" do
      it "assigns the packet as @packet" do
        Packet.stub(:find) { mock_packet(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:packet).should be(mock_packet)
      end

      it "re-renders the 'edit' template" do
        Packet.stub(:find) { mock_packet(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested packet" do
      Packet.should_receive(:find).with("37") { mock_packet }
      mock_packet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the packets list" do
      Packet.stub(:find) { mock_packet }
      delete :destroy, :id => "1"
      response.should redirect_to(packets_url)
    end
  end

end
