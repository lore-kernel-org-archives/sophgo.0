Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8914F1C68F
	for <sophgo@lists.linux.dev>; Mon,  7 Jul 2025 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848330; cv=none; b=eQqA255uWxhYNs1MUrxA6zu0owPYieUJeSvKU5Mqma5x2/0wYJs5mUkq5COiB/BhhPVTHLuRBsfd3vh06YTrbMqtryeqODh5RfcauYzYYBdpMuX2TQJkSNtOBZ+QU/dATD5uRrOWbGQ2cYgkKMPzN0tiQV5DnodE5r2kEWy34tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848330; c=relaxed/simple;
	bh=mhbc0WemYmG8rm7InaTf8LWaoJtr9oPrFfMT15Fe94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTksE7dLb7SjJVrCCEHZ1iN2LMp4Ukn+HmArQuispl76FtbaJdl//wjIeWGReRW4zK8vOyKG/5TxXT+WOi2+O61DCzsH/98f81oCV7HWyD0K9qZabJ5sboGOe7Lw7ruRPhCZO8AGVOS6c/QUqTnw3KnhZ/M94I/P5ScohvTdKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikv9qGLe; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikv9qGLe"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af6a315b491so2301559a12.1
        for <sophgo@lists.linux.dev>; Sun, 06 Jul 2025 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848329; x=1752453129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waNYge1pVnAmfDAo+Scw1VWP79dyDXSW85JWJajzOys=;
        b=ikv9qGLeu/brVuq0ZnSjef/le2otLRZakgnwGpBPgE3TXq04FS/jzr/ijq97X5jOki
         hI65jgr+5X38F1k2fd/zTM1j8YkVrywfAlwDX7VyKq/YKShn1MVdRiCxdI5waiJzw37n
         S2P7jGkqHN7ynA1XE0xTiXre9BQjDd+xCIELES0Aa2F+MszzYOX4ktithNLj02eMSgNi
         s2HjCvv6woW7tD+4m9G2DcJX28m4unZ1b1gVhqWcoh/ndY0iWX4K0VQoV0g6ikBHzS9U
         olw/hkPnYP08ADK/yJkXae/Jvi7DA/GBPxYjRKBNVju4/72iF/3ZnyvN959PEeiwK7SB
         OjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848329; x=1752453129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waNYge1pVnAmfDAo+Scw1VWP79dyDXSW85JWJajzOys=;
        b=MTKhEK7HeFXh+JW2hR95hHFkSMKjnEUxg0fjQXTPRgM966FmmMWich/ALKhcoB2BOH
         gsd0Ut0temKT/6CdnimVNW6an8XE3L/6K3rudcQ1XldYNCmxOfKBZzHvWVDwP+d/oc7V
         e+g55zrTQwjO9UvZyKxqNx2lqeSzsQWLNT0pvtJTJBWTfbXSU3lrm5KwBGPWAQqXsPSm
         dgn9qGye2kwTP27h8kMUs5hnSGzLVEcuXyz5/zjGP6kdevRHez6J6tRxTJhiWilvZ2Ky
         I0iGLs5TNnrHxlNWh9YyUijIK5oLzWLQje+f5gBcP0qI3KjNPJGiFARPZdAr3V75CSuF
         6PeA==
X-Forwarded-Encrypted: i=1; AJvYcCU0LxCswfGDtnP92+vKBmOognhTS/blgaDui8AU4uVr1OrHph1940gEbjEqo6Vo3+YzCCtWYiI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOu53lxr6FSgBhzIdXZCJgOrPFqgfkYpZWPtbGaZtP0F7ipbJf
	wXU2GCLA6nuumx5V31JSI+bte8kDdbjX70Z8yWsTSLiFzLcli498JHI9
X-Gm-Gg: ASbGnctKArQmasp0nDpuOnBq/YlTF6k4YhGozQ7T/zoOp80GchL/JfG4jkKty0A2fPp
	vEhzjw5UVj9LBauxuOxIxdeyc1Mck7TxEVVcV2MLJsw9ifTmukYAGEk8tffPlhEdoP+YtsInKu1
	GaFWfijpYRyNwpLn4h0yu5ob1VyuOmJNsJcfAr6AgQ+6ejhWgdqI4kwp7UZ+bHP8XOG+bFJ63SR
	wAc9BXuDN+SJd3j+XgQoUuFmBzfBs85jtVmpLPdua7K+lf8CHey95WdWXcSRWjATu19vCCN2PJt
	VNG7390P0TbKtq5ZN9BczljPKc4X14f1PE01TNW0Y8ayyj0P25tme0GUOWywsQ==
X-Google-Smtp-Source: AGHT+IEJfwXHQNDfml8NzaqLJBaxvkA9HUYq+A9+IyCh9ibIK7D1D9K8y86d2uYsm2pa9DcODEISyg==
X-Received: by 2002:a17:90b:3c8f:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-31aac4b2f1cmr15485476a91.20.1751848328607;
        Sun, 06 Jul 2025 17:32:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9cc66830sm10477012a91.16.2025.07.06.17.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:32:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 0/2] riscv: dts: sophgo: sg2044: add PCIe device node
Date: Mon,  7 Jul 2025 08:31:59 +0800
Message-ID: <175184826045.122679.3644918560620246720.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 09:58:47 +0800, Inochi Amaoto wrote:
> As the PCIe driver is merged, add device node of PCIe device and MSI
> device for SG2044.
> 
> Inochi Amaoto (2):
>   riscv: dts: sophgo: sg2044: add MSI device support for SG2044
>   riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: sg2044: add MSI device support for SG2044
      https://github.com/sophgo/linux/commit/29ce381d6bc61b23024c6ee42a5745d4becb28c1
[2/2] riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
      https://github.com/sophgo/linux/commit/55fd09df36d7c6ae59d82a7df5072827f65a0eb4

Thanks,
Inochi

