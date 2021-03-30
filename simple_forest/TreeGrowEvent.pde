

class TreeGrowEvent {
  
  public final String name;
  public final boolean justStarted;
  public final int level;

  public TreeGrowEvent(final String name, final boolean justStarted, final int level) {
    this.name = name;
    this.level = level;
    this.justStarted = justStarted;
  }
  
  public String toString() {
    return "TreeGrowEvent - name: " + name + " - justStarted: " + justStarted + " - level: " + level;
  }
}
