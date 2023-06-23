//
//  QuoteManager.swift
//  QuotesOfFamousPeople
//
//  Created by Elif İlay KANDEMİR on 23.06.2023.
//

import Foundation

struct QuoteManager{
    
    static var quotes : [Quote] = [
        Quote(text: "I'm not here to be perfect, I'm here to be real.", author: "Lady Gaga", gender: .female),
        Quote(text: "I'm not interested in money. I just want to be wonderful.", author: "Marilyn Monroe", gender: .female),
        Quote(text: "The only thing that feels better than winning is winning when nobody thought you could.", author: "Hank Aaron", gender: .male),
        Quote(text: "Success is not final, failure is not fatal: It is the courage to continue that counts.", author: "Winston Churchill", gender: .male),
        Quote(text: "If you can dream it, you can do it.", author: "Walt Disney", gender: .male),
        Quote(text: "If you want something done, ask a busy person to do it.", author: "Laura Ingalls Wilder", gender: .female),
        Quote(text: "If your actions inspire others to dream more, learn more, do more and become more, you are a leader.", author: "John Quincy Adams", gender: .male),
        Quote(text: "The best way to find out if you can trust somebody is to trust them.", author: "Ernest Hemingway", gender: .male),
        Quote(text: "The only Limit to our realization of tomorrow will be our doubts of today.", author: "Franklin D. Roosevelt", gender: .male),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou", gender: .female),
        Quote(text: "The most important thing is to enjoy your life - to be happy - it's all that matters.", author: "Steve Jobs", gender: .male),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs", gender: .male),
        Quote(text: "The best way to find out what you want in life is to try a lot of things.", author: "Oprah Winfrey", gender: .female),
        Quote(text: "In order to be truly happy, you must pursue your dreams and goals.", author: "Oprah Winfrey", gender: .female),
        Quote(text: "You can have anything you want if you are willing to give up everything you have.", author: "Oprah Winfrey", gender: .female),
        Quote(text: "Don't let anyone tell you what you can't do. Follow your dreams and persist.", author: "Barack Obama", gender: .male),
        Quote(text: "If you want something you've never had, you must be willing to do something you've never done.", author: "Unknown", gender: .none),
        Quote(text: "Everything happens for a reason.", author: "Unknown", gender: .none),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West", gender: .female),
        Quote(text: "Life is what we make it and how we make it – whether we realize it or not.", author: "Napoleon Hill", gender: .male),
        Quote(text: "The road to success is always under construction.", author: "Lily Tomlin", gender: .female),
        Quote(text: "The road to success is always under construction.", author: "Lily Tomlin", gender: .female),
        Quote(text: "I'm not a self-made man. I've had a lot of help.", author: "Stan Lee", gender: .male),
        Quote(text: "If you don't build your dream, someone else will hire you to help them build theirs.", author: "Tony Gaskins", gender: .none),
        Quote(text: "You've got to be in it to win it.", author: "Tony Robbins", gender: .male),
        Quote(text: "Success is stumbling from failure to failure with no loss of enthusiasm.", author: "Winston Churchill", gender: .male),
        Quote(text: "People often say that motivation doesn't last. Well, neither does bathing. That's why we recommend it daily.", author: "Zig Ziglar", gender: .male),
        Quote(text: "If you want to make your dreams come true, the first thing you have to do is wake up.", author: "J.M. Power", gender: .none),
        Quote(text: "The only limit to our realization of tomorrow will be our doubts of today.", author: "Franklin D. Roosevelt", gender: .male),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou", gender: .female),
        Quote(text: "Be persistent and never give up hope.", author: "George Lucas", gender: .none),
        Quote(text: "The best way to find out if you can trust somebody is to trust them.", author: "Ernest Hemingway", gender: .male),
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs", gender: .male),
        Quote(text: "If you want to live a happy life, tie it to a goal, not to people or things.", author: "Albert Einstein", gender: .male),
        Quote(text: "If you can't handle me at my worst, then you sure as hell don't deserve me at my best.", author: "Marilyn Monroe", gender: .female),
        Quote(text: "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.", author: "Jimmy Dean", gender: .male),
        Quote(text: "The only Limit to our realization of tomorrow will be our doubts of today.", author: "Franklin D. Roosevelt", gender: .male),
        Quote(text: "Don't let yesterday take up too much of today.", author: "Will Rogers", gender: .male),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot", gender: .none),
        Quote(text: "Don't walk in front of me; I may not follow. Don't walk behind me; I may not lead. Walk beside me; just be my friend.", author: "Albert Camus", gender: .male),
        Quote(text: "I can accept failure, everyone fails at something. But I can't accept not trying.", author: "Michael Jordan", gender: .male),
        Quote(text: "I have a dream.", author: "Martin Luther King Jr.", gender: .male),
        Quote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela", gender: .male),
        Quote(text: "The way to get started is to quit talking and begin doing.", author: "Walt Disney", gender: .male),
        Quote(text: "So we beat on, boats against the current, borne back ceaselessly into the past.", author: "F. Scott Fitzgerald", gender: .male),
        Quote(text: "A journey of a thousand miles begins with a single step.", author: "Lao Tzu", gender: .male),
        Quote(text: "Don't judge each day by the harvest you reap but by the seeds that you plant.", author: "Robert Louis Stevenson", gender: .male),
        Quote(text: "If you want to make your dreams come true, the first thing you have to do is wake up.", author: "J.M. Power", gender: .none),
        Quote(text: "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.", author: "Jimmy Dean", gender: .male),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt", gender: .male),
        Quote(text: "The best and most beautiful things in the world cannot be seen or even heard, but must be felt with the heart.", author: "Helen Keller", gender: .female)
    ]
    
    static func getRandomQuote() -> Quote? {
            guard !quotes.isEmpty else {
                return nil
            }
            
            let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
            return quotes[randomIndex]
        }
    
    
}
