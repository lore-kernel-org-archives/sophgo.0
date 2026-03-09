Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09972396B97
	for <sophgo@lists.linux.dev>; Mon,  9 Mar 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054593; cv=none; b=ff10X98gjS/WU9ToOp8h+gP+NZ0pZcM1KNFfljzpgeDKF2IteEnmVD6bJ+uuxPS5OsIdJyZFsiLuBLY4et74d/FWb13Em7uA8XRS5GWGR7p5SCadOv4/kkkM/jj8rgBFHdvpE5+uHvMwA6mACRB3aD5XiZV/wEwN6IRhRD4nPrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054593; c=relaxed/simple;
	bh=ddytEBfeTIqqm/TDaiTBVnx+F1sYYYNgbLYecdvWBdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOacELsXlqcNbd+/CuZ2qCzwPxbyq0srsHcJ+ybuSKZKCBiy0eyH6Vr25T53i2r2R7QDo0AbQdEklEPqodTfWc3dAT0okKFtMj1klZSNFNt9encClN1G8dK4R4tNjxcRhveWpnKiRs9hixO2eS/Onstg5N4BXcbpZJN8P5loeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAAHItlzqq5pnpElCg--.46862S4;
	Mon, 09 Mar 2026 19:09:41 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 09 Mar 2026 19:09:38 +0800
Subject: [PATCH 2/2] riscv: mm: Define DIRECT_MAP_PHYSMEM_END
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn>
References: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn>
In-Reply-To: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, stable@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID:rQCowAAHItlzqq5pnpElCg--.46862S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1kXryDtF1xWr1rCFyfWFg_yoW8Xw1xpr
	Z5CrZ2krW3J3WxW34Sy3Z0gr1UtFn8Kr4UKrWxCryjvan8Kw48Wrn0qa13KrykXanrAFy8
	WrnakFyrCwnrt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUTGQDUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On RISC-V, the actual mappable range of physical address space is
dependent on the current MMU mode i.e. satp_mode (See
Documentation/arch/riscv/vm-layout.rst).

Define the DIRECT_MAP_PHYSMEM_END macro based on the existing virtual
address space layout macros to expose this information to
get_free_mem_region(). Otherwise, it returns a region that couldn't be
mapped, which breaks ZONE_DEVICE.

Cc: <stable@vger.kernel.org> # v6.13+
Tested-by: Han Gao <gaohan@iscas.ac.cn> # SG2044
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 08d1ca047104..9c92a84e9755 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -93,6 +93,16 @@
  */
 #define vmemmap		((struct page *)VMEMMAP_START - vmemmap_start_pfn)
 
+/* Needed to limit get_free_mem_region() */
+#if defined(CONFIG_FLATMEM)
+#define DIRECT_MAP_PHYSMEM_END (phys_ram_base + KERN_VIRT_SIZE - 1)
+#elif defined(CONFIG_SPARSEMEM_VMEMMAP)
+#define DIRECT_MAP_PHYSMEM_END \
+	((vmemmap_start_pfn + VMEMMAP_SIZE / sizeof(struct page)) * PAGE_SIZE - 1)
+#elif defined(CONFIG_SPARSEMEM)
+/* DIRECT_MAP_PHYSMEM_END is not limited by VA space assignment in this case */
+#endif
+
 #define PCI_IO_SIZE      SZ_16M
 #define PCI_IO_END       VMEMMAP_START
 #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)

-- 
2.53.0

