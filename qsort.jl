macro swap(x,y)
   quote
      local tmp = $(esc(x))
      $(esc(x)) = $(esc(y))
      $(esc(y)) = tmp
    end
end

function partition(arr, left, right, pivotIndex)
  pivotValue = arr[pivotIndex]
  @swap(arr[pivotIndex], arr[right])
  leftPivot = left

  for i in left:(right - 1)
    if (arr[i] < pivotValue)
      @swap(arr[i], arr[leftPivot])
      leftPivot += 1
    end
  end

  rightPivot = leftPivot

  for i in leftPivot:(right - 1)
    if (arr[i] == pivotValue)
      @swap(arr[i], arr[rightPivot])
      rightPivot += 1
    end
  end

  @swap(arr[right], arr[rightPivot])
  return (leftPivot, rightPivot)
end

function approxMedian(arr, left, right)
  if (right - left < 5)
    return sort5(arr, left, right)
  end

  for i in left:5:right
    subRight = i + 4
    if (subRight > right)
    subRight = right
    end
    median5 = sort5(arr, i, subRight)
    @swap(arr[median5], arr[left + div(i - left, 5)])
  end
  
  return approxMedian(arr, left, left + div(right - left, 5))
end

function sort5(arr, left, right)
  for i = left:right
  min = i
    for j = i:right
      if (arr[j] < arr[min])
        min = j
      end
    end
    @swap(arr[i], arr[min])
  end

  return div(left + right, 2)
end

function qsort(arr, left, right)
  if (right > left)
    m = approxMedian(arr, left, right)
    leftPivot, rightPivot = partition(arr, left, right, m)
    qsort(arr, left, leftPivot - 1)
    qsort(arr, rightPivot + 1, right)
  end
end
