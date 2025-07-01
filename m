Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D984C97
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751332671; cv=none; b=M/MPCkT6n8YMdKK9+fbHg5+J49C0AlAFEgwcasx8/DSwkXUlSgr9+G4wwTuP4rcNZh8nPFUxUpjKxxUROV/gAf+VBaTADaavm+tXQzpnr2IqiEwU0KNpTCkxm8YHryY3dg6MQnaUf+rGxatzCHn15sWfaO5rv7DUtLUvQzqhbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751332671; c=relaxed/simple;
	bh=TGlE1ClG5lRsETj4AoTpjuZ+SJ6lqQwK3MaW0+seb5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TH5fNWhvTj1y+WhJC7MZIlhqUDhqSXcTYsWyKowG6xg2kM21hkuNOM9/tGkJR9ta59bQsm8Qvk35ahIu+wfjem5onhg2gwa9iqadZ8jk8y5PkJ1RY+BgPKPJeb48YjzV2o5gen+ylMjfvzdjykiIdBdSZjY3JQn5OPP+RW+clRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOKSayI1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOKSayI1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-237e6963f63so15815305ad.2
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 18:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332670; x=1751937470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ5PSiL5QPW5hfxzuODNHVt+lrCUk5bVb4SwiUVsQ4U=;
        b=aOKSayI1m3L2FlMqXiwbYhyIlMgsVIZM1/6mVM1EAOZAIrZXiZxIAyZeIcidkVsc18
         gzaeXv4sfrTojmuEvBOP59DVPyYR69He3zwOCgPfUzG7udNCbCs7BDacDKPerMkn4Wij
         2uwyWqkGy4JP7DU3t5sL2tNa17FtlDnvgu28CxXZ9+gOLHwynAj7cP3imAEyTLYLVv6K
         WYLSjdr1AIfUE9pYNQGLiZczZPoLfI82yAVK/caZTdjxXUdgQ0thXdMsG+33Z0xBLL7A
         qVS2ojCn48VsKlOlEtqUVnjWD7V7v70UybntYwyNQCRTcVyoFlEvsO7hTHgCC8wxWztM
         FzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332670; x=1751937470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQ5PSiL5QPW5hfxzuODNHVt+lrCUk5bVb4SwiUVsQ4U=;
        b=XjRY2k6W8IbwN0wytusFKw6bd7KQGEjXswC1tCJ+N0qYpS3/EKojNFPrkOXrXwUUHu
         OLWcy4HWLAAH0vvaUjImvTN4ZCGRYdhHrsP8V7FlMo77IXyyvEx95JXV3COnojGoPYzf
         FnvwOtHqO+5z4buxSfRC3GWypKgVOsKgr0xsk4s8NXCm1j5PUNd1eXOU1WZeA3iifhEO
         esmeRvtFxKAjiy1iYHl0S8iphye+6XIl/bj9MvwFu+Sk0kZSxLllNdOfgf5lgwyx+k4D
         CjFn/4wXEY8zuMje5um/AzGhS95L1K2RhqB7L2b0ObpE/Nm1h2SyeCqsA1R9cTJNJF61
         6hcA==
X-Forwarded-Encrypted: i=1; AJvYcCWyvYSxbW+SWQw67wJroTxXPCCr5aV+RqeKiPa0jyN6YqfiB7ak5LNk8pWkx14Tv01vEQwJdQM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze3ck6c8vlVKqK6CJdWngS1T++4Hi0abbgBX0Uaple7vJ/E09s
	jBMIgb8eO4JdTRD+GQVhCTcYXArL0sn6LqPHeW21Lc4HuMwUVPvcYUh6
X-Gm-Gg: ASbGncvIw52vMO+yapQq1su6kQnaBo0Ugntwpg6hbL7B2bXYvjWPxOSfQTfXfc8SoMb
	SEzSl17Ju/tCXa5tTyKC1/TyctKXBfe4/gou4DlL19dvPDwX7/VRxFfLIxh9TSkfrfhFoJ20ESo
	TqFA/MzscENkLRpNwy844sgiot7YtO82HVA7pW3N1m12kshah6zkjdmGjHJOJU+8FnVQiOzVAKa
	grFTc4JOW3JvHM7m8nZZDqaEEe+VJ71ivvuLUZqxs2uatKGNObGOTiy9EoYvBTvDKwZOZZxHWUI
	RoIPD3iSs/nyFakPuSQKGxosIHZtkQcH9kCqril0K++ezdaC46gxKPIDkdlYyA==
X-Google-Smtp-Source: AGHT+IElz440y4qt2E6KOe7YdVb1HqXdStD0Ju2Kyn/eXs9IIdlP1Xrn5joO/n/a2gIxs2JVHnRjPg==
X-Received: by 2002:a17:903:2f0d:b0:237:ec18:eae5 with SMTP id d9443c01a7336-23ac4633e8cmr229326945ad.27.1751332669591;
        Mon, 30 Jun 2025 18:17:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e301cd38sm9250116a12.17.2025.06.30.18.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:49 -0700 (PDT)
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
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Tue,  1 Jul 2025 09:17:25 +0800
Message-ID: <20250701011730.136002-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device binding and dts for CV18XX series SoC, this dts change series
required the reset patch [1] for the dts, which is already taken.

[1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com

The patch is marked as RFC as it require reset dts.

Change from RFC v3:
- https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
1. patch 3: change internal phy id from 0 to 1

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

