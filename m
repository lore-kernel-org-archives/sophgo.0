Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89B126C05
	for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924871; cv=none; b=n+t0fNCNaCsKPnXRDvTTTTXecwA7y/Z5+KmTlqJkYQehqYN0gQJJfC2RHbW9m9csxdWZKCJmdbnh2iIYwGcx7xv2kOgaDRbxxqHLzINFtHvY2T+enrVGFXNRhUq3DKY9f3Xn6EaMc8c2QAsG1gnB8hbcicJ9ULRjuJ1E1oDXuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924871; c=relaxed/simple;
	bh=ZSFdLmJABSxbFmRELSJUwLft1Dgap42cZsZ6vAmJvr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxDh/iObzhHx3sBNd7tAwVWuJZuX+d3nRI3LZwCyuqZ6k7Uwypb4UA4HP2s3MDuRrysEd8jRyulyZ7vgsaYBH1xzeHkCnxtyWQqAxpqWQfprSbeju/ZU1ypCtl6ea3xkfPKFf7522YJDpWKrul+uBlV9GhpoebeHGrN30A4uKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9mc/z5P; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9mc/z5P"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3121aed2435so721614a91.2
        for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924869; x=1751529669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MutTzljpNoSQQ8KY/Naa1K0a5hKmtznD/W4HGzANsVs=;
        b=P9mc/z5PPuJvsUwkZ3i8EEZTtZxIxkgvDQP7srio7m/ZeGiiNGPea6AkG/dQbJtXcw
         afAa3de/t1SH/iKx+iaZBKTiAGWPQI162zbGXeF9YBZm8a93pWjmr84KynAaRs3cenUR
         oRzP83tSL1iLMbWXJF9i5wvsMRz9A9aHsAv44h+zqTFARg8qPnVfnAOkr5Yz9A/EtuFU
         h9rUBEx5aOVWL7qdJAytHrFTgCMxuWo+FksbWm/jU5Vx6dqSjaPJWb3t2Y2UWzDwPVY6
         XqA02N9eWKVLQRtQBN1SEbKi0p6sKdjMQ7JO0IedDyXjInCXICjdIYIVceo3pfGT/umD
         AqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924869; x=1751529669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MutTzljpNoSQQ8KY/Naa1K0a5hKmtznD/W4HGzANsVs=;
        b=FlBeZhEzRhFX307FRjV3gyHc/q6TnYbC5urmw1EgAQ5xcYOBzf8SNZ8wL4vr7fTYaE
         Z4KcJtvBvtQGvlcCeIsI8FNA/af6tfE909dHi65vJFFhp5phJkojKYgwYlT3m/YEghnx
         wSY3ObAiXjZcPskelv4dGnFTB4SgfT5tddfaPXFx+ObnADvBkDE+0uZGGV7Py8c2ffaH
         WMrFXznjY0ey5gNqJfYxOFX1ytV265YkOlIxkkOBut1AFiTiea+QXRy7zsEtkOve7lX9
         3hO4THlMMRc7KAvRi5OYBUUHxOtdZ8wmDX28X9PcKmduEEWEgdklrtS6X2ynbph2IJy4
         9UhA==
X-Forwarded-Encrypted: i=1; AJvYcCUjYovtgB4fbo7IClDBf7PdA6Bkn4xET3hu/ndyBl2frJbhtANFX+4ljB5zRT5C/aYhnTPz9pQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8g+LlSN6iYsbVCrrjkUb5cKd4Giu57SV1ipnkLbjhrkYXqXzY
	jIDO6fFiH3njmlsikAJgUnwajnGPEAlzAX5Rsesckv3W7JFkGuLj++1m
X-Gm-Gg: ASbGnctg/SWWgktw76vAvozhrFkAeKJ6teaaYYQfhH5uQqZAtTOXFcGqKYYdmZJFJse
	llfLuk3P0swvB+gwGi7BXVxZWRKd2eb25VnYwK0QyeIEjnpLzo/jsfAI/o/xK+Cx4fjY5ZvxR3p
	3ajOL41bLSmsankQCZDtZU/r9nFV59X6Ex37366H24QghCjbHHm6s+v8e36C5bCLJGYoXxpBugm
	vDpU+wXP5i9jXFDXMTQ4W5n/uI1b2cz44aEeZ90xMZn1hcJMhJkeQNcbqqOvC04p84NxH9sBklC
	K3fxQ8VNcPeT8U68K5cX3e/F/NNJhsjNPR+nQSICLpQBjVuRuO/dvdIC8Mo1vg==
X-Google-Smtp-Source: AGHT+IEvFHP6OohPGoe/i9ODcPd4CzHYZYohuqPcN6oUCsWyV/2LcB0WXZlgW3DjTlwzc5TunaJepw==
X-Received: by 2002:a17:90b:350e:b0:312:f54e:ba28 with SMTP id 98e67ed59e1d1-315f2689fa0mr8936538a91.24.1750924869022;
        Thu, 26 Jun 2025 01:01:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f53f3a64sm3785918a91.48.2025.06.26.01.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:08 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 0/4] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Thu, 26 Jun 2025 16:00:50 +0800
Message-ID: <20250626080056.325496-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device binding and dts for CV18XX series SoC, this dts change series
required the reset patch [1] for the dts.

[1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com

Change from RFC v2:
- https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
1. patch 1: fix wrong binding title
2. patch 3: fix unmatched mdio bus number
3. patch 4: remove setting phy-mode and phy-handle in board dts and move
	    them into patch 3.

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Enable ethernet device for Huashan Pi

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
 3 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

--
2.50.0

