Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB5848B396
	for <sophgo@lists.linux.dev>; Wed,  1 Jul 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910520; cv=none; b=HO1Y0v5aAUXSMFxkDH7oyYoBULUeM4HnwpIm9vh6eqv3GW6HEnFmldLbjr/H92PUZlPjFHkElRVJRzVjh9GjpjbXKf1jZmX2aHY+HVJuETUgPL9jRtBjAPgglXduJGGNo4CAcVLeJRVi4VB9/NEsK4zdyAeHvWKOjk1riOyulcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910520; c=relaxed/simple;
	bh=AZMqGWE/1kDk6APgiFn067C7/pSKrIkfc/qqQaj5N6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbOaX/6C5WKgfZXT8SZPDCXV8vOQRUh16uYKw5cJmtYI1UIRvIQhM2r/R8AYff+fZVGHyuFZFcb2bQI8PZ4BxWxoXa8TThFIWZojv1IMJUkY6maB2pOaXFfHZfeNFvsjkZ+kYp+LqD2zja0882hsc+eqfI5LF24OOIOLSROQUPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBu5o/UM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBu5o/UM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845eb7b96feso300740b3a.0
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910518; x=1783515318; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiBQQxNYM4uZUtFA87RPryKjgpX8pd16ygJCO2DXwWg=;
        b=mBu5o/UMFurb4/9i+FdGs7dmIjuL2T2mSqas0YSeq0VI1Quu/IQnUAOCc/Yp0lPpUp
         kmNp6F0uFJQS6p39AU40xhPn+8uIMZPtPRkQgC8cwHgl6R8Iyx9qjmlOdz37OrpkiDS0
         h43NWAlxTjCP2p6FS2QNFDBDSf+1jgn1YOhgrwBToFKArYINXIGtEl2H1b1rkfyRgtdu
         M4Zeab+26cTH9U5n+udNCaY+5WFAOj3xmQEwdwrrCGxIsyNFnrxe747kwWfJqhM4TVZB
         dwcFbVf6LnhjuPaG5qrTCm+q6SqTgZaUtvCU9u4IrPxXiK1obBtQEuMW11a6F8Ut/CrA
         F0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910518; x=1783515318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiBQQxNYM4uZUtFA87RPryKjgpX8pd16ygJCO2DXwWg=;
        b=l9Sf3i09xP0O40fiXCIZ7p1vqnSPCQunp7EmW15JRKzl7NOPGbXkdzv2vUGVB8IACJ
         QoX2YFfA6QfqvzniyoIGJv10UhIbCe/yaewBq0tJMtcj7P3l/lL4viajfp9WcgFeStQ+
         TvQLrj+dll+pMLquhyW+wbDk88umdWO+r3x/tOWM9SOUlOsCRBZ0tci/fHGKZsZcj+Iu
         t/IaeyxgEbE4JPy+BtJ90GOw0aAUjk5I9Iv2LO+EMkUAbwEt92KiDitcJBQGsfsh2JTe
         m/oisPUOlICba3Zayr+gf1twOAnMYqSJESf1DqafZcPP6JRA/fuakFfmLVYQBxkez1dm
         lGng==
X-Forwarded-Encrypted: i=1; AHgh+RoY6MR0yA1FydMnZeSK1zg/eV6zujg0pEpZKPtnauXKlW9c4hPWukwBvtfMvxhgC2pAFciLr+s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtri3wA8/6BLUC5ENn84HsNlRPY4DOIgAvQTzki87FjbAXYMfJ
	bpAPWKfXBZBoGh5TnyhJl7cINRPI/lMcThqNBywIPfkI/hDRCpxoAnOU
X-Gm-Gg: AfdE7ckpZUp+HRYS4cZiLaE9gvT7k7H9dEzGN2AyqHyqVFv3HCzfHpYHiMmUf5sNukh
	Yjv3wH4vin6FjkilQGnKJqO1lYTFuag4WweWoMVUpHzhMDZhLRM7BICgpJQy3ZxoYyrx5m3VA2m
	RwJwEltFpIMFPfmMmtpmbBO+udwqU5ysJhwT9Za1Smn+07flKB61eWhF4QRSF3RgbGnx7JAmMEG
	iYvJ++3vHjwdxXjTU9epwK2+5F68XwCs8r/vEXYjnzpGRQ+6ZhdMr/SF0Y8H95Pe32ZrQz0VPIk
	At5V2Rqnv2ftluV7J/iTqFY9m+5ljutdZPLFSGkwybezh0qE2j8Oq3Q8aVcbgO91HfpSQuzp6iZ
	BTcXf5FqlKzJd4DlKjgXSefkG1WLXYoD3m/o1HsHlCQDL4aTfUN60QT4uSCe7p9YL6EdNx4L7n7
	siARxI84x0QRmfYpvV0tG7u4RqQxIXcHU=
X-Received: by 2002:a05:6a00:3d0f:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847c0ad5539mr1299225b3a.61.1782910517479;
        Wed, 01 Jul 2026 05:55:17 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:17 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:29 -0400
Subject: [PATCH v5 16/17] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-16-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=AZMqGWE/1kDk6APgiFn067C7/pSKrIkfc/qqQaj5N6U=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vZ0bcszqXWzr7H3vl/xnun9rDRel9u3b78RzeZ9K
 Pl8q/7BjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZgImz4jw8/3Bw6vvM7R6vxn
 zpxcu+Ste19xJK+qf7zmv0FxXf+P4GJGhv2zd2Q0h4gHqRl26a6cfqCR0Ynj2U9pH0c7rRNzT/v
 EcgMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Simplified the commit message.
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0

