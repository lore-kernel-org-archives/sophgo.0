Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6780628C2D4
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550011; cv=none; b=LrskOkqgqfNiVp1Ww8vH0HeeTXcAmGbyfz1ayzN8RsHYQGdFPb/toa4fTC64G+b6q3/c3Kb2wYEFXjk7rIDVXN+GHjcDhGpS+Uy5T/dCb9QtUx2mES48f3713wVDXa5tkcLoOa/IicOOkHEY6jD8NfdYQnaTkkbcu9H8Fcet/uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550011; c=relaxed/simple;
	bh=PamMD/KQ/Tc3wf7I/9ZGLwO4ho0/Zl/EqGjIfRDfHNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEZfy3XYGeR0UbFCoMl5V6yto2NNNQj8zly1zesQiEi4WjAOpz4V0xsTAJR/548zu+g1OHOcoImzbTvtSEOM+R9exRz6tgRYL6fmzhwTZCH6nAl5U7VM5y3YaOF7yQtkWtp/AzjCNyF7bj/yCNESginI6mwWX39OZLsPOdMnyFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=qQqk2ZGY reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="qQqk2ZGY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550004; x=1781086004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PamMD/KQ/Tc3wf7I/9ZGLwO4ho0/Zl/EqGjIfRDfHNQ=;
  b=qQqk2ZGYe4OcVFhsKxkeGhDcJw4fhqXwrXbrBeGYjdTIgzwxPY+TXJW6
   UAHsQl5kx7sVgJt6g4FWgBM+zI/89TnVuidUnN4Q5nsj2lcmJWOv6WCRy
   txD471ToK+lzsgrVSJIDbM2wuiwAVOGg1SQTrCnAso7eZ4ouxSB8K3cIr
   VJnpEjDVeKP5LF6p6jYiKGEm+Nm4yGDxtdq+ZBznLReRF9mZIzQBJAdgP
   iy034nESbx4Mgz5O2Uk4Ll4fD/Cpy24D8w2y82TPmmllPY9sWEfrvZJIb
   iuiNpQymlS1c/1Hw/pwAcRwVKyX8X7FvpA/tn9TsSD12pTDS3BIZWiIiJ
   w==;
X-CSE-ConnectionGUID: 1qc+i9WNTyy54Tf82XKzxQ==
X-CSE-MsgGUID: jtPXsk3+TzuIK3rloJbTsA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:42 +0300
X-CSE-ConnectionGUID: zrXBagmjR2WpPykf7AB43Q==
X-CSE-MsgGUID: s24i75iAQBWowkf1smTQLA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:39 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:40 +0300
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
Subject: [PATCH v2 6/7] irqchip: aclint-sswi: reduce data scope
Date: Tue, 10 Jun 2025 13:05:39 +0300
Message-ID: <20250610100540.2834044-7-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move variables to the innermost scope where it is used

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 186a021beaef..3aa074004dca 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -67,11 +67,7 @@ static int aclint_sswi_dying_cpu(unsigned int cpu)
 static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 					void __iomem *reg)
 {
-	struct of_phandle_args parent;
-	unsigned long hartid;
-	u32 contexts, i;
-	int rc, cpu;
-	u32 hart_index;
+	u32 contexts;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -79,7 +75,12 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	for (i = 0; i < contexts; i++) {
+	for (u32 i = 0; i < contexts; i++) {
+		struct of_phandle_args parent;
+		unsigned long hartid;
+		int rc, cpu;
+		u32 hart_index;
+
 		rc = of_irq_parse_one(to_of_node(fwnode), i, &parent);
 		if (rc)
 			return rc;
-- 
2.43.0

