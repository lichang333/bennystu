require "vending_machine"

describe "VendingMachine" do
  let(:vending_machine)       { VendingMachine.new(250, 10) }
  let(:empty_vending_machine) { VendingMachine.new(250,  0) }

  context "Buying Scenario" do
    describe "#amount_cents (getter)" do
      it "should return the amount of money that has been inserted into the machine" do
        expect(vending_machine.amount_cents).to eq(0)
      end
    end

    describe "#snacks (getter)" do
      it "should return how many snacks are left in the machine" do
        expect(vending_machine.snacks).to eq(10)
        expect(empty_vending_machine.snacks).to eq(0)
      end
    end

    describe "#snack_price_cents (getter)" do
      it "should return the unit price of a snack" do
        expect(vending_machine.snack_price_cents).to eq(250)
      end
    end

    describe "#insert_coin (instance method)" do
      it "should update the vending machine account balance (in cents)" do
        expect(vending_machine.amount_cents).to eq(0)
        vending_machine.insert_coin(100)
        expect(vending_machine.amount_cents).to eq(100)
      end
    end

    describe "#buy_snack (instance method)" do
      it "should let you buy a snack if you inserted enough money (happy path)" do
        vending_machine.insert_coin(200)
        vending_machine.insert_coin(100) # We inserted 3 euros, snack is 2.5 euros
        vending_machine.buy_snack
        expect(vending_machine.snacks).to eq(9)
        expect(vending_machine.amount_cents).to eq(50)
      end

      it "should not let you buy a snack if you didn't insert enough money (error path)" do
        vending_machine.insert_coin(100)
        vending_machine.buy_snack
        expect(vending_machine.snacks).to eq(10)
        expect(vending_machine.amount_cents).to eq(100)
      end

      it "should not let you buy a snack if there aren't any snacks left! (error path)" do
        empty_vending_machine.insert_coin(200)
        empty_vending_machine.insert_coin(50)
        empty_vending_machine.buy_snack
        expect(empty_vending_machine.snacks).to eq(0)
        expect(empty_vending_machine.amount_cents).to eq(250)
      end
    end
  end

  context "Refilling Scenario" do
    describe "#snacks=" do
      it "should let a technician refill a machine" do
        vending_machine.snacks = vending_machine.snacks + 10
        expect(vending_machine.snacks).to eq(20)
      end
    end
  end
end
