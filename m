Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C24A0935
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963953; cv=none; b=BOoTn9mGMlc4Mqj28drnmsISavNQodHLp/0N9w5cDtV+rgZ7oqonY398xvvSsovOXPsGT5lw8JCr41HK/fhWTNGN1sFHsTZ6sUZqBRr5zTm46cu8l8cVGmmsu8BexBEoujSB1n0Izqn6JmrP0E+MpaGNHXYHYX27bHK7XjVrc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963953; c=relaxed/simple;
	bh=FG/LJNXH1VUYYc/k/8W7Og7Fpv4MygAGBEKkCvtgcNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcI+ZlXRmdMhjOnkPoeka1ZeZ2EPpwtxkdqxdsPvEHWUXY2VhQqUqznIJ8E7lthvmkup0lvpQq1Nro7K/GbwteYzjkgHP4ytXKj+bFqZT0Ib1x9VN/UH7WP/ES5cZBufWRwMkDA5xoRdxP/s2ifENJbS+r3dwEb9+F8nQYJwDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw+ZNdxK; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw+ZNdxK"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1702100a12.3
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963949; x=1792568749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=Yw+ZNdxKJnog++rd1ZM/U2gK0OyobzmolhnH17tr+S+9Rp1TdQL0eRg03c4YuzZvra
         TnouMPIZjuOBuyIDi96oSZ7AgP00T0iaSOfaSovlW6D3gjEHR8CtRGvs/jwBkaYlvP1P
         9E3mIRl332aR340/dSQdwl06M6A9XzqlPmY3RUtw8t/2wbWzWz7s/XnUHm3vUAH57Ayp
         zu1LuT6Osq6QwKyBWa5t7wSDhDIQabReVxVT7cJJR5zXwaZiKgvY7KUlK89XBQmNhpNt
         6dDmRpyyShNfJD7u7iE+L26dyqfb7Q+LGa5YOlr0o9edjfYXEL5ueOyXzvKE+cMwK4WY
         KvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963949; x=1792568749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=Z0uHzZcsemzBX++Slue2mhOmmYA0bF5ppkZxg0hBBbqA7rODnzoLbd4Ad2ZNn+BQXu
         vumZWx6ZOXVFqKXQOHPf+6B2G+Pi1YmCQh+xeK88WjIWnHfmftjXn/vMK9kw/WxCOubZ
         MgPgIQXO8GXlFKz21zXUkfFomTDiRKTQrKrs81wUTUy/fKV39IdaY3MhdDb5dI1+X/zA
         7L5GfwuPcqwpz0HTJXKc7N/JCM1Ovy9SdlRV+9hrWrSZREbjcWwJan76h2xi0rypkJqh
         HRhomX39uhNAB6d8IqOMZp+BRqBMgZ/TL/662KdYm9RcsqOgzr5ZSclVpcQLxhQ1gNxp
         V+kg==
X-Forwarded-Encrypted: i=1; AKwUvBwPIk4hTJyDXwgbxSHXUAuV0sQpWJEJ2XBrTvvl5r+XYtiWrerx5dos0a539O7TrHDHS5uEo2g=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3vnjMlghGD3uJp3TNBlbc2ssREq9esTg7kbs38uFYAlPk36iZ
	S/8jXMMhCm5P/p6R0FtcUDARPL499jNBlI+8wsJVUmlj84cacUBPCemn
X-Gm-Gg: AYBFou1FGlSsTi3ZUEvqQ9vox6jNMdz+TfMqvzAmHWcO9pOJR6rObDN0gxKHUDmmmib
	VUZ2JlF0h1E28v9lYSx+1fm2lCRljdzwz4ZYtNVh0ESSb9zsuGBikI2dnZmfdz6WgA4kvlyKrey
	C0Si3Y/Kxxi+8HWvnBIYf2zrquTm3OQXBw2ipAblKsbAsS+cAjmZijl42dvXerKY68JohnWSsn5
	aGh317nwITofchYNztuKCgprHXUzACVlvgP0gsBI1TmsrA9DHlOXANgBifebIAwYuXF9bea5VLU
	2+fenLqlJ8bV/x8eA0AxzdzwXFToE2E1x30PVXpkbJS/KR2d2Wt6pllPqNPm0xBWeawX4pdVRDf
	7FgATygN7sHNMF2EZHsdcdATuYp8/hwKrBii4Zn0S/l/UjImA1Pu1ATSQCkQyPxZhHaecOvy/w3
	5klpHkiyQXhH4xFTkzUKe+HZU/tObRmouKPlEbxwRtDxvrlgndUZpjvt25nj1taSdmeouE
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2e842ab6a10mr114098215ad.15.1791963949146;
        Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1347sm67038615ad.44.2026.10.14.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] Add SG2044 eFUSE driver
Date: Wed, 14 Oct 2026 15:45:12 +0800
Message-ID: <20261014074516.240247-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,efuse.yaml          |  61 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 177 ++++++++++++++++++
 6 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.0

