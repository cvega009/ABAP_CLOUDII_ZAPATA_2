@AccessControl.authorizationCheck: #NOT_REQUIRED
define hierarchy ZCDS_23_LOG_C367_CV
  as parent child hierarchy(
    source ZCDS_22_LOG_C367_CV
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      Employee

    multiple parents allowed
    orphans ignore
    cycles breakup cache on

    --multiples padres
    --nodos huerfanos
    --nodo donde no se puede determinar el arbol,
    --la relación y se quiere salta al siguiente nodo

    //    generate spantree
    --se encarga de asegurar que no hay múltiples padres

  )
{
  key Employee,
      Manager,
      Name,
      $node.parent_id             as PerentID,
      $node.node_id               as NodeID,
      $node.hierarchy_is_cycle    as HIsCycle,
      $node.hierarchy_is_orphan   as HIsOrphan,
      $node.hierarchy_level       as HLevel,
      $node.hierarchy_parent_rank as HParentRank,
      $node.hierarchy_rank        as HRank,
      $node.hierarchy_tree_size   as HTreeSize
}
