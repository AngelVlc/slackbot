module Lita
  module Handlers
    class Echo < Handler
      route(/^echo\s+(.+)/, :echo, help: { "echo TEXT" => "Echoes back TEXT." })

      def echo(response)
        puts "User", response.user.inspect
        puts "Message", response.message.inspect
        response.reply(response.matches)
        response.reply_privately("You sent me '#{response.matches}'")
      end
    end

    Lita.register_handler(Echo)
  end
end