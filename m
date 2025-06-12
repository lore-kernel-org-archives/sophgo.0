Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B85C25B312
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739172; cv=none; b=jJOYZ/297hJjUNwb7i3R6HL0t8aSopwfGuHnXUfUzdpq1cxKruzgx1aFQQ3n2VMrh7D2xFqTH++hFGGi4beXF7kk1t5ENtP49amqiIyrhbDptTwQD3iB8j/necWzfHKBGcHwcE5VEpyVpUytBWdKQr//e9rPOThSUYl0mQ9YvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739172; c=relaxed/simple;
	bh=LMCbJCAp6bbeSvRYKpbQ/PpB/GPQVCZzGN5f5K2rlYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyICNr2yyVtp5pwOcJU8g4oHhyEW+q7CLUEiHCNEiR4/OhM+C33KjQfFxEX5ArUxjX27H0WVBzU2W7SOG0yho6FuqDYqBq9wzv2DywOuxk2Uv+ExuLqqetYaO56o7OVyl4KZGjcfO8pRulPttXpsViRLd2I6p9/zij8ql6uzC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=FlByJmw+ reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="FlByJmw+"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739170; x=1781275170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LMCbJCAp6bbeSvRYKpbQ/PpB/GPQVCZzGN5f5K2rlYA=;
  b=FlByJmw+UR0wAWJYGDCk6ieZQNoFRgsEocwZDkbj8mje/Z9hsV4hnes5
   A4n7qNPStKpSySEZVqqKytG98XiVdtkX5ATmYzbnsxJh7t82dleez2gis
   9oWlFIEyFAaTFUginueyRnYvbx92CZSoRSuNR+Ki/A5uWu0PegN/msR09
   m9SlzWiWifx03MVA9uzPRryrqDC1B0qnnlOTTp8uY3nXC63TZND7qyA7S
   L9z0+cayMXD7SLU3BJeWGmOoriW+OCSCR3XuXN04gXmLG5NpF0KXgWZ+m
   mToUyj0SUptz8QM5rHhVOdBBq+JA4RQhOmUpm46PHtp1KoXZ9wpMLxVUE
   Q==;
X-CSE-ConnectionGUID: kaw0obreTG6pIMrqQh4+Dw==
X-CSE-MsgGUID: 8Zn9PXwdQAyHL9CE6pylZg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:20 +0300
X-CSE-ConnectionGUID: UjMjNaakRTm0/KPcek5JTg==
X-CSE-MsgGUID: TU5gZLFjQmq3pd5BLTSRhw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 12 Jun 2025 17:39:19 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:19 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 5/7] irqchip/aslint-sswi: resolve hart index
Date: Thu, 12 Jun 2025 17:39:09 +0300
Message-ID: <20250612143911.3224046-6-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve hart index according to assignment in the
"riscv,hart-indexes" property as defined in [1]

Link: https://github.com/riscvarchive/riscv-aclint [1]
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 5e133cf29737..81d28a53635e 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -72,6 +72,7 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 	unsigned long hartid;
 	u32 contexts, i;
 	int rc, cpu;
+	u32 hart_index;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -93,6 +94,11 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 
+		rc = riscv_get_hart_index(fwnode, i, &hart_index);
+		if (rc) {
+			pr_warn("%pfwP: hart index [%d] not found\n", fwnode, i);
+			return -EINVAL;
+		}
 		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
 	}
 
-- 
2.43.0

