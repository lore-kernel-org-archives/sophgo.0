Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0312367AE
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629034; cv=none; b=JBGfuEL0F+vnB01lTaVPpCoc1095zkPtCaea8yrMgEu7u3LFOzh38m36E+gRlyTCBxiTVWidXLapMpPqPi8ej5emzEddHq0IwZvFnMI62Cl/JiBAlD7AeVCOPzBGBX6mGfFgp6pd7hTcf1pMctR3KyQRPEBlF65ng83kbVz8pWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629034; c=relaxed/simple;
	bh=aVABoyFzwx85oLCM7K97SuAwDlDMkxU4RoMkLM63GJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lq2bXKXtgjSNm8cToW83UEKQqzucq3qhJL0BniyXNFjPORcghYrW+VDhoYz6nK1FvDZI8+9myeukKqWF04bbtYOhEULCL7+ybiFRhCIQsa6iuKrsykPyWnEtbdIE7LF7x5jO6RdpsN4EbST3ARwWCu4eZVAXz0sBWjGvWTHH3Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLigrAhR; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLigrAhR"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d20451c016so339622385a.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629031; x=1750233831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDPKzl/HokW1bKViSHJhhALGLh7FDXnYOeKnzw1e8Ss=;
        b=nLigrAhR4wEIJtdEwu8ZvnGnoFRL+5eRD0flwlWxt4WB5Q0X/dylOJyGE8Z+GkC6W9
         hHvwEwyQPPGK/Te8Pnyf/wcpK6m2HC387QBUjxukP5wZ15ad92PYUwqHuUDuWjc6UUri
         ygjkU3sByVfiBG1T7qtyRIzOKFSIuXSEbwZIj5vRZfG3k+SgqNdkr/7SDkPAW6QrRsws
         7RUwLjA0lxl8TYhfJP+88FnvrBFwHNp/3qoXmqsAO/Ud91V8A8vCLzMNRB97iqfzoo2a
         C3TKHmZTdjOPqCwKz4b+4ldsIED6fGxylmuBlUVF8EcW4hZQJRCKGGnoGd63HAzgVfk2
         QqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629031; x=1750233831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDPKzl/HokW1bKViSHJhhALGLh7FDXnYOeKnzw1e8Ss=;
        b=uxgsv6NCodWv/pqaHvm2AgGu6qoaeMzsynxbzf9HyQbsQNukWfsprFRZSyq6onppUc
         Dte11RoZYsS1TbN0d49NQxaOAAckx9JvfC4ROaTrrY7fnP+ODZu/lS8lMPIXUdsqgRZ7
         iYJirREEPu9ldm26AeFbVHhcETf4qmoamU1EUIFV/f6Tmqw+bL7WZ3O6RbVtZ/al/+AC
         6z9l4HrQmvTHlaa0NNcrCIeeFYvQrG4YHsiTkhRp+j2ZAO7ns5227q7EV4yZ/RiaS3O2
         SQgD+q1xDveqYxvZM8FVPPLidEEItL9OFQ1t4k9QES3lHMgOPSDahO9+8V+EkuxjWC5u
         3hsw==
X-Forwarded-Encrypted: i=1; AJvYcCV9I7HFe7JbvIsqYu9yr4GV3ecOaX+K6uxYbHnpKGtVwMg9KLLv4gO9I+TgFLY7pkDtcRaXM7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxguX4IJ8DHyBavd4KLjau+9rrqlQu3+6wU3ravPCi99DGcafbT
	AV2zbLbaA99HinKrphuzTtF+O9uqvWIo/jcf8IChQJvrYlCbu8hBfrSh
X-Gm-Gg: ASbGncsyT45qGMt8s8xg0mPxiejWTKf2Kyl+ru72re9H7EjC7mFMPkfePlS0xgSPL5Q
	dcTVaqEvno2U7mBrYyRWZ5VxVRfzJG7qs7ldr+WuY/YcoMECD0JdOBJpKpbqEva56P1H39kLVDA
	1Cj37HFYnHlxnHnmQ1JawoKYJAzXDvP4weWCkBXcc1QOvqGH9Aa8wmobhb9VtaMKfQrB+ctgedO
	sWkgeXRLkCjCxwa+8nHlMdPF4XzvlFGr/px+Xk57xsgsA8mil8Clfj1slXll/3k/IdzoF9BYC9A
	cjM4e29nBE2pVrhJU3LHfDS+TDsqrwz/53Ao2w==
X-Google-Smtp-Source: AGHT+IGmp+EzAiX+KAE1F9bGl2MqzBQoWq5zi9NmJE6sYIlDWxZBH2JCYpju3CBjIhOcLVFq1e+owQ==
X-Received: by 2002:ad4:5cab:0:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb2c32a9bcmr35065916d6.12.1749629031132;
        Wed, 11 Jun 2025 01:03:51 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1ce86sm79639716d6.61.2025.06.11.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:03:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: Add Sophgo CV1800 MDIO multiplexer
Date: Wed, 11 Jun 2025 16:01:59 +0800
Message-ID: <20250611080228.1166090-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080228.1166090-1-inochiama@gmail.com>
References: <20250611080228.1166090-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sophgo CV1800 uses an internal MDIO bus multiplexer to handle the
internal phy and external phy. The internal phy is always on MDIO bus
address 0, and the external bus can be configured with different MDIO
address.

Add documentation and compatible string for the MDIO multiplexer on
CV1800 Series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,cv1800b-mdio-mux.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml
new file mode 100644
index 000000000000..abe0004c8b6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-mdio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B MDIO bus multiplexer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  This MDIO bus multiplexer defines buses that could be internal as well as
+  external to SoCs. The external mdio bus can be configured at different
+  bus address.
+
+allOf:
+  - $ref: mdio-mux.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-mdio-mux
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@3009000 {
+      compatible = "sophgo,cv1800b-mdio-mux";
+      reg = <0x3009000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mdio-parent-bus = <&gmac0_mdio>;
+
+      mdio@0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0>;
+      };
+    };
-- 
2.49.0

