Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE737D098
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147318; cv=none; b=nz+aLRxujaMl8YblqN8P41XsoCkgoNlUZUX22rLTuwzzGanQtyOhI8NBlF9he9yV4MeoTAzX53NZCQexvfCu2sptFtsfpiSVzvEfdOVK8tOpjJf0EG5mJj5HVArOvwxAtNezZuinH6c7fNJHbg//G8L7rI/gI+VkDl3rzFOaQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147318; c=relaxed/simple;
	bh=De7XYB6QHWScaXMrwuMMJ+W/6CHJ7mVgZNt3dfyxcgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hefd5X5x2I+E+mMad/GPd1MKChzZbpFrwLLusIfHD4W8eAbV7ZBtBbd+L0zmuy1n0BX2LjveSLpIOuumYCwXLKxZVnw+xFc4ThxUaf4YIO/r+eoRYxt5UfWtfJu9jJPPHM9PA3AwHxCAlTtrF/kgJhJ3t944j7ywso1vM+JPpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccWFtjth; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccWFtjth"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-791875a9071so29225606d6.1
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147315; x=1760752115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq1v/Nf3lHeaiUxgTl8qnZzG8T6G34OVI2HiAKdMAek=;
        b=ccWFtjthzQvDtZeHLH3Eef99rN/GfYcvSMphjJm0m5M9EZqI+nvzDI/rtu/DhnDR8O
         efAWhz7YGnG1EmAwdeUSuqD8KUQa/yvR7id/cn2GI8eAZBx0Vo3phGe5OEKZ6AtRtSE0
         BK9eJl0nLwnCJvcMK6P3dibBvG1sG9i+xMzUcxzBjsOgMXJa++eMqBYl1P+bQhFcTubh
         K5/F1ScuaqFPoC2aWb/GDaWGYRaF05rMFjQ9mMSLTutcBmH4nErBQLL+VvDsvgCLz38z
         Sx1qbWF61QJ7V4ShqY4sobxCGtjDTTHm5JYgODzdVfEnyPjRcnoCl1sNG0q+c9qPs9cT
         pdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147315; x=1760752115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq1v/Nf3lHeaiUxgTl8qnZzG8T6G34OVI2HiAKdMAek=;
        b=qezdmmLNg6h14Cvgy/qtS70O+K7X5nbpmKZgvEfTgOMCKzK9nZSZgIDtyMuI4f7zEI
         ORhe+fsGjb4hzlf+LX4NvMJQ5lTcdenB9o9TTWcE04j862b5gO0TpgNCeSv4xRK7bUPU
         1ZprHsjVjeKB5ebkZUhBhf132iLABpI5mvggYCWMenm0ZtXKD5kjVEQYn65rTLYPOTdE
         G2HQbAp4GmM95nGZ3XbhSdvobskS1LyOyw8OMiq6dGr+5YgQ0eLv6OdNVM7Sb8A7UIOW
         x+bZqdnrfw19ZP8T6P6TGdrR8zPxmrbp0X2pW+PIHnqOlVl+eChgKr8TpxZXuDchgxDV
         g/9g==
X-Forwarded-Encrypted: i=1; AJvYcCUu3NH3wBTPkxJYqacvKDi+gxlmALP2jQg6wVuy/e7whNVLwUfDuc5a4HtSqT3Bi8KbnXeFiH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDJ6QB3SUQV7HxoyXD/qfDPyftBn7IYgUN/76Iakd0ZSzNWRNB
	cSEBO4hR5n9RKpqJ+V7MbWLHa1eQ4QjfOxmgVKSVZlowTZUkCxrpR74Q3hpJy7yJ
X-Gm-Gg: ASbGncuI50SHzdu7X5V6jixvHzN8ZkR4q7s48aZdIDhZVrRt9yr5oOhNfTsDEo/lO13
	6ZMgiqC3WkMvTUGiU7V8Iy2HpacAOAyWGoMky16ySdqm2jeNDBWxrcA6n3DnIoxdLarss8WF/W8
	QTodPmKXy5Y+xp3Ogwwc3mv03dBnjnNS2E7LrvgxqGsyjrT+BCCUpqoH8s+yWYN5xKNzfY1nPxJ
	G3nJd9zzXtJ7igkY4NfyIp83RUEbREUrtSzG1zUtW3RjfjGBaMGrbI0pnQSIttu2iVwo5WWO/Ul
	CYFoeNlzl/0nDdaGbCy4yXtvNvtfCE9n4ki7dwDFf63P22UQrpvXRzzbYiCPKZXhbKH4ErG4eGc
	50GB84/kiYYEHDba7Mh7tm98oLlHcjRtjjaqYUgnsV/TWMOg5e/jWfe0otVmWcE5tcZGtXDnIqC
	q6pTPybrLHHg==
X-Google-Smtp-Source: AGHT+IEJw4orlmJ4tYBxRoLE7eRi8PKUBgmmkCLHKFSaNSJu+ZXO6O/fHEeJK38T18LVEo4ah+bedw==
X-Received: by 2002:a05:6214:268b:b0:796:6034:c0fb with SMTP id 6a1803df08f44-87b20ff9e9fmr191000946d6.13.1760147315339;
        Fri, 10 Oct 2025 18:48:35 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:35 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Fri, 10 Oct 2025 21:48:09 -0400
Message-ID: <20251011014811.28521-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC [2] on the ARM64 side. The RISCV
side uses the SOPHGO CV1812h [3].

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]
Link: https://www.sophgo.com/sophon-u/product/introduce/cv181xh.html [3]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..63773811b80f 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -25,12 +25,17 @@ properties:
       - items:
           - enum:
               - sophgo,huashan-pi
+              - milkv,duo-s
           - const: sophgo,cv1812h
       - items:
           - enum:
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
2.51.0

