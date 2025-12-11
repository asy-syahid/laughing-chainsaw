"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";

interface BottomNavProps {
  items: {
    label: string;
    href: string;
    icon: React.ReactNode;
  }[];
}

export function BottomNav({ items }: BottomNavProps) {
  const pathname = usePathname();

  return (
    <div className="fixed bottom-0 left-0 right-0 z-50 border-t bg-background md:hidden">
      <nav className="flex h-16 items-center justify-around">
        {items.map((item) => {
            const isActive = pathname === item.href;
            return (
              <Link
                key={item.href}
                href={item.href}
                className={cn(
                  "flex flex-col items-center justify-center space-y-1 text-xs font-medium text-muted-foreground transition-colors hover:text-primary",
                  isActive && "text-primary"
                )}
              >
                {item.icon}
                <span>{item.label}</span>
              </Link>
            );
        })}
      </nav>
    </div>
  );
}
