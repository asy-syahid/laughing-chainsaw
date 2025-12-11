"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import { useState } from "react";
import { Button } from "@/components/ui/button";

interface SideNavProps {
  items: {
    label: string;
    href: string;
    icon: React.ReactNode;
  }[];
}

export function SideNav({ items }: SideNavProps) {
  const pathname = usePathname();
  const [isOpen, setIsOpen] = useState(false); // Mobile state

  return (
    <>
      {/* Mobile Trigger */}
      <Button
        variant="ghost"
        size="icon"
        className="fixed top-3 left-4 z-50 md:hidden"
        onClick={() => setIsOpen(!isOpen)}
      >
        <span className="sr-only">Toggle Menu</span>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="h-6 w-6"><line x1="4" y1="12" x2="20" y2="12"></line><line x1="4" y1="6" x2="20" y2="6"></line><line x1="4" y1="18" x2="20" y2="18"></line></svg>
      </Button>

      {/* Overlay for mobile */}
      {isOpen && (
        <div 
            className="fixed inset-0 z-40 bg-black/50 md:hidden"
            onClick={() => setIsOpen(false)}
        />
      )}

      <aside
        className={cn(
          "fixed inset-y-0 left-0 z-50 w-64 -translate-x-full border-r bg-background transition-transform md:translate-x-0 md:static md:block",
          isOpen && "translate-x-0"
        )}
      >
        <div className="flex h-16 items-center px-6 border-b font-bold text-xl text-primary">
            HOMESYNC
        </div>
        <nav className="space-y-1 p-4">
          {items.map((item) => {
            const isActive = pathname === item.href;
            return (
              <Link
                key={item.href}
                href={item.href}
                onClick={() => setIsOpen(false)}
                className={cn(
                  "flex items-center space-x-3 rounded-md px-3 py-2 text-sm font-medium transition-colors hover:bg-accent hover:text-accent-foreground",
                  isActive ? "bg-primary text-primary-foreground hover:bg-primary/90 hover:text-primary-foreground" : "text-muted-foreground"
                )}
              >
                {item.icon}
                <span>{item.label}</span>
              </Link>
            );
          })}
        </nav>
      </aside>
    </>
  );
}
