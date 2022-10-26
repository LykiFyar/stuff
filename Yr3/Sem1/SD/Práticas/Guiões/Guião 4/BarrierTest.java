public class BarrierTest {
    public static void main(String[] args) {

        int threads = 10;
        System.out.println("Number of threads = " + threads);
        int barrierlimit = 5;
        System.out.println("Barrier limit = " + barrierlimit);

        Thread[] t = new Thread[threads];

        Barrier b = new Barrier(barrierlimit);

        for(int i = 0; i < threads; i++) {
            t[i] = new Thread(b);
            t[i].start();
        }

        for(int i = 0; i < threads; i++) {
            try {
                t[i].join();
            }
            catch (InterruptedException a) {
                throw new RuntimeException(a);
            }
        }
    }
}
