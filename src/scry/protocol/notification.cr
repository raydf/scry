module Scry

  struct Notification

    @method : String

    def initialize(@method)
    end

    def compose_json(io)
      io.json_object do |object|
        object.field "jsonrpc", "2.0"
        object.field "method", @method
        object.field "params" do
          yield io
        end
      end
    end

  end
end
