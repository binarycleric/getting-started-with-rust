require 'ffi'

module Hello
  extend FFI::Library
  ffi_lib 'target/release/libembed.dylib'
  attach_function :process, [], :void
end

Hello.process
puts 'done'

__END__

threads = []

10.times do
  threads << Thread.new do
    count = 0

    5_000_000.times do 
      count += 1
    end

    count
  end
end

threads.each do |t|
  puts "Thrad finished with value=#{t.value}"
end
puts "done!"
