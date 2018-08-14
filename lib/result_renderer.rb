class ResultRenderer
    attr_reader :output

    def initialize(output)
        @output = output
        @template = ERB.new File.read('public/index.erb'), nil, '%'
    end

    def render
        @json_output = @output.to_json
        @username = @output[:username]
        File.open('output/index.html', 'w') { |file| file.write(@template.result(binding)) }
    end
end
