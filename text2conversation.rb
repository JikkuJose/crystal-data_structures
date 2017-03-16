require 'json'
require 'awesome_print'

recipient = {
  name: 'Nathan Wadhwani',
  avatar: './assets/images/nathan.png',
  time: 'just a while ago',
  recipient: true
}

sender = {
  name: 'Miss Malini',
  time: 'just a while ago',
  avatar: './assets/images/miss_malini.png',
  recipient: false
}

script = %[
  Hey!
  Whats up?
  Hey, Nathan! Doing good, what about you? Nice to meet you!
  Looks neat!
  Are you ready?
  Just getting there, but think I sound alright?
  Yup!! What all can you do?
  Hows the backend?
  Not too fast, I am told not to reveal anything ;)
  Comeon!
  Talk please?
  I shouldn't talk much man! Will sound too stupid now :D
  No, you won't!
  Give it a try?
  Okay, so what do you want me to talk???
  Talk anything!
  Or tell me whats left?
  They seem to be working on my brain all day, feels really weird up there!
  Do you feel good?
  Are you happy?
  Think, I am in a existential crisis! I don't think I exist!
  So, how do you talk now?
  Hmm!
  Think am talking now?? I am just repeating what they scripted!
  You mean you will repeat?
  Script??
  Yes of course, I only have a set of responses! Don't believe me?
  Okay, then reset!
  Na, show me!
]

sentences = script
  .split("\n")[1..-1]
  .map(&:strip)

chunks = sentences
  .each_slice(3)

conversation = chunks
  .flat_map do |fragments|
  option1, option2, response = fragments
  [
    {
      text: option1
    }.merge(recipient),
    {
      text: option2,
    }.merge(recipient),
    {
      text: response,
    }.merge(sender)
  ]
end

json_string = JSON::dump conversation

puts "export const conversation = #{json_string}"
