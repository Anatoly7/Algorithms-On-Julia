function heapSort(arr)
  buildHeap(arr)
  for i = length(arr):-1:1
    arr[i] = getMax(arr, i)
    heapify(arr, 1, i - 1)
  end
end

function buildHeap(arr)
  for i = (div(length(arr), 2) + 1):-1:1
    heapify(arr, i, length(arr))
  end
end

function getMax(arr, heapSize)
  result = arr[1]
  arr[1] = arr[heapSize]
  return result
end

function heapify(arr, i, heapSize)
  largestChild = i

  while(true)
    leftChild = 2*i
    rightChild = 2*i + 1

    if(leftChild <= heapSize && arr[leftChild] > arr[largestChild])
      largestChild = leftChild
    end

    if(rightChild <= heapSize && arr[rightChild] > arr[largestChild])
      largestChild = rightChild
    end

    if(largestChild == i)
      break
    end

    tmp = arr[i]
    arr[i] = arr[largestChild]
    arr[largestChild] = tmp
    i = largestChild
  end
end