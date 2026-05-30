Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E23546F6
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162530; cv=none; b=ZtJ3mAYuSYuYKJENwz05zc1mKf7DK2bbctUANWUvC6pvlXn24d274vDkCEVQSkqYbwHoLsVH5RwzQ5edQXEfugyqpnp8L85DftXPAPlamAuzqSWCuWiwVPfPspd2bbrUETxqny4Cfnvk0SYILOf2rOxebHj6pH4BXK4wbXCLq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162530; c=relaxed/simple;
	bh=/iKoxf3LOftVvnFst+ry8upkECO2m/4sz8OzKStj6vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2Km5iQAOUX4awP63T5zJ3BsmELkMQhUqcet76CU5soSUh0waDWA6/Tqw2L/ykTVIf7bKpG2rM7YwIgDMxgQazVnlNWiMamYxgw8oOc6gJm9Jg/JVk3DpO0H/brWuE/+Al+37TteDZVzhZfc26YY9nRN6YxjLnppN4JsIkgnCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVkPVyFj; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVkPVyFj"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-914c12b9458so457989185a.2
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162528; x=1780767328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=pVkPVyFjXN+uF8Kf8GIxJZG3buD5+xmPjDBeFNUQVxTKx9xSnPEKY+V1WNDalJrWKX
         /ZRl6igkehr3mmv/5Ovb+r073GgOYLtO1N7LfE5sLP0v7YRqX+TofH4ORVhRhalXu6r9
         3v0zTY/ehZ/Bn0/EQ8v3hFL8pb/NmrYRS4hIMbv1tt7q+VbxEVgfzCMp4ghn71YsmdIU
         K4vYMau+tAWYwudgUzNA4ui0hXdKhXeq6M+fgAICF+YR/IqNAbjTsBoXcow3lFQHCbzu
         SWAI6qclmIjmMYLBcivy7q0eBLO/5wvTO1mulviduouTqxDNgy72BPpM1gqqDxac4Gbp
         mTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162528; x=1780767328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=pzpE53pcdd7i2CYE6bUn+iP8eT9BHAvOZP1m0/W+RkoLV4lNE60+ov2V3izX4lqZRx
         MaC7kkjtupVgiHxGTYwdVxk6xpcbsbBDa5ENgYIItL+ksblSSki2cNQDSkqHrY1LOiRu
         B9bInU8IhvL/Bs3Im7wpCFDSBjA1xeOKOCioiFJq6vVZqG4Tu8YgMrCAm9e6SHW8TLAA
         APaRTva/GeG5tI5HuQnFzJeobMKkrPHQGMJV3rz3vms8U56OCI2i/DBxRF4PTS0fsvFW
         E9cB/xtPZYC1Zv3dOWYxReYehTpmDH0CWtAogo8+xhUmdwNFB54gpfE64dC5+5ZdX2wh
         zQcw==
X-Forwarded-Encrypted: i=1; AFNElJ+gQiNSLWmT5rva62P8vgRYKoz2amBwYjiLAT9Oly1/FxAZGikxjKjVQCq8KSXCOMVYxjKIW6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLxr0sM5NhjYim/BB+NVIjzK2G0ddgq45rLbZn8rMXFGneYZCH
	V1b/j2j3y/ohhK7VQatbv0VyLagRcYRotW+CPWw4W4Jon+uC4HZA6Nn7
X-Gm-Gg: Acq92OGLj4bNmZY8uRRJPh5t6xhw1sVu040SyC1ut/8X6B8bXaM74cuIYmiBSCH9Aew
	NH2f4cxGks3Iiko2psvea377+YCFy1xGtDYnlJEuNRT7KiB7dX4HEwKGZTerB4y0N6/A4oEUKZ0
	5q7gqdKx7Ctm4R3HVGEhfOPIGCi/CaZmkPQw9djZxfYaiYTJxiqMrUV1IMRAtAHBXflMra0Dk1z
	t18U6eESDx1N4UGVSLXhyYY2XkRMqK93xD5ozVRGCJq76I9DI9ABnpx1tIK6GgWt3O1yZ7I3/JT
	CmdFmkhM5Y/sCQ5BUwiVdntSq91+y3v2piuUfp/0gXAzkyMehBFC8gEbul1SFfjnttbaxh2pAel
	Xe/zJNkHRThwN8uCVuMRc3qtqzymmvn+DBFUzyIoZxCCsMkE57y1O2H9330iVMfDnV9dPHiwAp5
	0hni+Mu85G9sLob128XrA6C1/DjTyW4vfat7J0Ev6CSSzcyh3R9EGelt8Q/OAvPMUBBbI=
X-Received: by 2002:a05:620a:241a:10b0:912:c0b3:7d9b with SMTP id af79cd13be357-9153d96aed6mr474347185a.24.1780162528422;
        Sat, 30 May 2026 10:35:28 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:27 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Sat, 30 May 2026 13:33:43 -0400
Message-ID: <20260530173347.33533-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.53.0

