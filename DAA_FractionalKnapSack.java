import java.util.Arrays;

class Item {
    int weight;
    int value;

    Item(int w, int v) {
        weight = w;
        value = v;
    }
}

public class DAA_FractionalKnapSack {
    public static void main(String[] args) {
        Item items[] = { new Item(10, 60), new Item(20, 100), new Item(30, 120) };
        int capacity = 50;
        Arrays.sort(items, (a, b) -> Double.compare((double) b.value / b.weight, (double) a.value / a.weight));
        double totalValue = 0;
        for (Item item : items) {
            if (capacity >= item.weight) {
                capacity -= item.weight;
                totalValue += item.value;
            } else {
                totalValue += (double) item.value * capacity / item.weight;
                break;
            }
        }
        System.out.println("Maximum value: " + totalValue);
    }
}
