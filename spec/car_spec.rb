require_relative '../lib/car'

describe Car do
  describe 'x_delta' do
    it 'current > previous' do
      current = Coords.new 5,0
      previous = Coords.new 1,0
      car = Car.new
      car.current_position = current
      car.previous_position = previous
      expect(car.x_delta).to eq 4
    end

    it 'current < previous' do
      current = Coords.new 1,0
      previous = Coords.new 5,0
      car = Car.new
      car.current_position = current
      car.previous_position = previous
      expect(car.x_delta).to eq 4
    end
  end

  describe 'y_delta' do
    it 'current > previous' do
      current = Coords.new 5,5
      previous = Coords.new 1,1
      car = Car.new
      car.current_position = current
      car.previous_position = previous
      expect(car.y_delta).to eq 4
    end

    it 'current < previous' do
      current = Coords.new 1,1
      previous = Coords.new 5,5
      car = Car.new
      car.current_position = current
      car.previous_position = previous
      expect(car.y_delta).to eq 4
    end
  end

  describe 'speed' do
    it 'x distance > y' do
      current = Coords.new 5,0
      previous = Coords.new 1,0
      car = Car.new
      car.current_position = current
      car.previous_position = previous
      expect(car.speed).to eq 4
    end

    it 'y distance > x' do
      current = Coords.new 0,1
      previous = Coords.new 0,5
      car = Car.new
      car.current_position = current
      car.previous_position = previous
      expect(car.speed).to eq 4
    end
  end

  describe 'starting_moves' do
  end

  describe 'available_moves' do
    #    0 1 2 3 4 5 6 7 8 9 1 1 1 1 1 1
    #                        0 1 2 3 4 5
    #  0 . . . . . . . . . . . . . . . .
    #  1 . . . . . . . . . . . . . . . .
    #  2 . P . . . . . . . . . . . . . .
    #  3 . . . . . . . . . . . . . . . .
    #  4 . . . . . . . . . . . . . . . .
    #  5 . . . . . . . . . . . . . . . .
    #  6 . . . C . . . . . . . . . . . .
    #  7 . . . . . . . . . . . . . . . .
    #  8 . . . * * * * * . . . . . . . .
    #  9 . . . * * * * * . . . . . . . .
    # 10 . . . * * N * * . . . . . . . .
    # 11 . . . * * * * * . . . . . . . .
    # 12 . . . * * * * * . . . . . . . .
    # 13 . . . . . . . . . . . . . . . .
    # 14 . . . . . . . . . . . . . . . .
    # 15 . . . . . . . . . . . . . . . .
    it 'returns the coords' do
      car = Car.new
      car.previous_position = Coords.new 1, 2
      car.current_position = Coords.new 3, 6
      expected_next_position = Coords.new(5, 10)
      # expect(car.next_position).to eq expected_next_position
      expected = [Coords.new(3, 8), Coords.new(3, 9), Coords.new(3, 10), Coords.new(3, 11), Coords.new(3, 12),
                  Coords.new(4, 8), Coords.new(4, 9), Coords.new(4, 10), Coords.new(4, 11), Coords.new(4, 12),
                  Coords.new(5, 8), Coords.new(5, 9), Coords.new(5, 10), Coords.new(5, 11), Coords.new(5, 12),
                  Coords.new(6, 8), Coords.new(6, 9), Coords.new(6, 10), Coords.new(6, 11), Coords.new(6, 12),
                  Coords.new(7, 8), Coords.new(7, 9), Coords.new(7, 10), Coords.new(7, 11), Coords.new(7, 12)]
      expect(car.available_moves).to eq expected
    end
    #    0 1 2 3 4 5 6 7 8 9 1 1 1 1 1 1
    #                        0 1 2 3 4 5
    #  0 . . . . . . . . . . . . . . . .
    #  1 . . . * * . . . . . . . . . . .
    #  2 . P C N * . . . . . . . . . . .
    #  3 . . . * * . . . . . . . . . . .
    #  4 . . . . . . . . . . . . . . . .
    #  5 . . P . . . . . . . . . . . . .
    #  6 . . . C * * . . . . . . . . . .
    #  7 . . . * N * . . . . . . . . . .
    #  8 . . . * * * . . . . . . . . . .
    #  9 . . . . . . . . . . . . . . . .
    # 10 . . . . . * * * * . . . . . . .
    # 11 . . . . . * * * * . . . . . . .
    # 12 . . P . C * N * * . . . . . . .
    # 13 . . . . . * * * * . . . . . . .
    # 14 . . . . . * * * * . . . . . . .
    # 15 . . . . . . . . . . . . . . . .
  end

  describe 'next_position' do
    it 'north'
    it 'south'
    it 'east'
    it 'west'
  end
end
