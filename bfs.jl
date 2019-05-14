function bfs(list, v)  # in dfs queue is replaced with stack
  q = []
  used = zeros(Int64, length(list))
  push!(q, v)
  used[v] = 1
  while(!isempty(q))
    now = popfirst!(q)  # popfirst! - pop! to dfs
    println(now)
    for u in list[now]
      if (used[u] == 0)
        push!(q, u)
        used[u] = 1
      end
    end
  end
end