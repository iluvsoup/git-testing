local binarytree = {}
binarytree.__index = binarytree

function binarytree.new(number)
    local tree = {
        value = number,
        left = nil,
        right = nil
    }

    setmetatable(tree, binarytree)

    return tree
end

function binarytree.from_list(list)
    local tree = binarytree.new(list[1])

    for index = 2, #list do
        tree:insert(list[index])
    end

    return tree
end

function binarytree:insert(number)
    local direction

    direction = number <= self.value and "left" or "right"

    if self[direction] then -- does something already exist there?
        self[direction]:insert(number)
    else
        self[direction] = binarytree.new(number)
    end
end

function binarytree:invert()
    if self.left and self.right then
        self.left, self.right = self.right, self.left

        self.left:invert()
        self.right:invert()
    end
end

return binarytree