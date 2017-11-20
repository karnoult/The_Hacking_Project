require 'digest'
require 'pp'
require 'pry'

LEDGER = []

class Block
  attr_reader :index, :nonce, :timestamp, :transaction, :transaction_count, :previous_hash, :hash

  def initialize(index, transaction, previous_hash)
    @index = index
    @timestamp = Time.now
    @transaction = transaction
    @transaction_count = transaction.size
    @previous_hash = previous_hash
    @hash, @nonce = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficulty = '00')
    nonce = 0
    loop do
      hash = compute_hash_with_nonce(nonce)
      if hash.start_with?(difficulty)
        return [hash, nonce]
      else
        nonce += 1
        print "#{nonce} - "
      end
    end
  end

  def compute_hash_with_nonce(nonce = 0)
    sha = Digest::SHA256.new
    sha.update(
      @index.to_s +
      nonce.to_s +
      @timestamp.to_s +
      @transaction.to_s +
      @transaction_count.to_s +
      @previous_hash
    )
    sha.hexdigest
  end

  # * transforms hash into array
  def self.first(*transaction)
    Block.new(0, transaction, '0')
  end

  def self.next(previous, transaction)
    Block.new(previous.index + 1, transaction, previous.hash)
  end
end

def create_first_block
  LEDGER << Block.first(from: 'Kévain', to: 'Romain', what: 'love love love', qty: '100')
  pp LEDGER[0]
  add_block
end

def add_block
  i = 0
  loop do
    puts 'add_block'
    # instance_variable_set would allow us creating a variable dynamically
    LEDGER << Block.next(LEDGER[i], get_transaction)
    @transactions_block = []
    i += 1
    p '========================================'
    pp LEDGER[i]
    p '========================================'
  end
end

# ||= si vide alors assigner sinon ne pas assigner
def get_transaction
  # blank_transaction = Hash[from: '', to: '', what: '', qty: '']
  loop do
    puts ''
    puts 'Enter your name for the new transaction'
    from = gets.chomp
    puts ''
    puts 'What do you want to send?'
    what = gets.chomp
    puts ''
    puts 'How much?'
    qty = gets.chomp
    puts ''
    puts 'To whom?'
    to = gets.chomp

    transaction = Hash[from: from.to_s, to: to.to_s, what: what.to_s, qty: qty.to_s]
    @transactions_block << transaction

    puts ''
    puts 'Another transaction? (Y/n)'
    new_transaction = gets.chomp.downcase
    get_transaction if new_transaction == 'y'
    return @transactions_block
  end
end

@transactions_block = []
create_first_block
