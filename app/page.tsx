import { Header } from "@/components/layout/header";
import { Footer } from "@/components/layout/footer";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";
import Link from "next/link";

export default function Home() {
  return (
    <div className="flex min-h-screen flex-col">
      <Header />
      <main className="flex-1">
        <section className="space-y-6 pb-8 pt-6 md:pb-12 md:pt-10 lg:py-32">
          <div className="container flex max-w-[64rem] flex-col items-center gap-4 text-center">
            <h1 className="text-3xl sm:text-5xl md:text-6xl lg:text-7xl font-bold tracking-tight">
              Modern Housing Management for Everyone
            </h1>
            <p className="max-w-[42rem] leading-normal text-muted-foreground sm:text-xl sm:leading-8">
              HOMESYNC connects residents, technicians, and administrators in one seamless platform. Manage requests, payments, and community updates with ease.
            </p>
            <div className="space-x-4">
              <Link href="/login">
                <Button size="lg">Get Started</Button>
              </Link>
              <Link href="#features">
                <Button variant="outline" size="lg">Learn More</Button>
              </Link>
            </div>
          </div>
        </section>
        
        <section id="features" className="container space-y-6 py-8 md:py-12 lg:py-24">
          <div className="mx-auto flex max-w-[58rem] flex-col items-center space-y-4 text-center">
            <h2 className="text-3xl leading-[1.1] sm:text-3xl md:text-6xl font-bold tracking-tight">
              Features
            </h2>
            <p className="max-w-[85%] leading-normal text-muted-foreground sm:text-lg sm:leading-7">
              Everything you need to manage your community effectively.
            </p>
          </div>
          <div className="mx-auto grid justify-center gap-4 sm:grid-cols-2 md:max-w-[64rem] md:grid-cols-3">
            <Card>
              <CardHeader>
                <CardTitle>For Residents</CardTitle>
                <CardDescription>
                  Easily submit maintenance requests, pay rent, and stay updated.
                </CardDescription>
              </CardHeader>
              <CardContent>
                 <Link href="/resident" className="text-primary hover:underline">View Demo &rarr;</Link>
              </CardContent>
            </Card>
            <Card>
              <CardHeader>
                <CardTitle>For Technicians</CardTitle>
                <CardDescription>
                  Manage work orders, track time, and update status on the go.
                </CardDescription>
              </CardHeader>
              <CardContent>
                 <Link href="/technician" className="text-primary hover:underline">View Demo &rarr;</Link>
              </CardContent>
            </Card>
            <Card>
              <CardHeader>
                <CardTitle>For Admins</CardTitle>
                <CardDescription>
                  Complete oversight of properties, payments, and personnel.
                </CardDescription>
              </CardHeader>
              <CardContent>
                 <Link href="/admin" className="text-primary hover:underline">View Demo &rarr;</Link>
              </CardContent>
            </Card>
          </div>
        </section>
      </main>
      <Footer />
    </div>
  );
}
