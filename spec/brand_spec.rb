require("spec_helper")

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }
  it("ensures the length of description is at most 100 characters") do
    task = Brand.new({:name => "a".*(101)})
    expect(task.save()).to(eq(false))
  end
end
