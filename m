Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E145203706
	for <sophgo@lists.linux.dev>; Mon,  1 Sep 2025 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707670; cv=none; b=XVYCPJRzAVHLCYUpMzD9mw4M86szoeBinw6xbTDY5gmVNv6SiT3jUX6/VqOZcHerOUh/iua2BwxXVdv3UEPoxT+STNQCpqSZ3poHCJiqTDe+XlhXIar1ETP4Hk0U1z5MZYV/Sd9tqCVuqVqHMrVdAKd7dhhiOfFxwPmNRlz0XHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707670; c=relaxed/simple;
	bh=jEIt+3X+NGZuxr9lCHefPQ1whPLGQgrV83ljVA6Wt6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWpKQ/67dTtCmkjui4uTCWAT37JE9QjLm3N1o9Xrj6oV/nGzlT06awyKkOjaeAUgT+XZv9U9BwhunNb2ia53AwO5q1RXijj/GghQWjQCFDaXiyMBAWAtBbu0ZmlYFiv45BA8GJ4hDOsT7E/yZPISu2XZLBVaWdq2j8T5MrDgv88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llbw7uiI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llbw7uiI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24a1274cfb1so8964575ad.2
        for <sophgo@lists.linux.dev>; Sun, 31 Aug 2025 23:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756707669; x=1757312469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM0VzPvZOoadSqld8QAB06APoe2QVLiP88e6xJF3DNg=;
        b=llbw7uiIINRpJ4AmRAixuFnH6+tAf4pqmydchoLkpXr+s/LUcp2KbKe4EhHus7lF0a
         6yPhpURAoKzmESeXkOj0NlR/PL7qdDt7Mak5VdEn38XIZT0+vXOl7n5VtCqxahv/udCs
         2T/Rpl494OLfnqVtyvndmAt2apBSKHVHVNpq2o/Pn64k/JxFg38YMAEsC2K7NEfERoKi
         AmNyV5nJg9Lnf7cE5tF3inC7n9/4wNj8uH1q4T+F5h5bAS9Y4yRAk9hiEGklzIErzHHw
         jPZc7KneBgGk6s54qmqNLFy2Z/ruUkT76WBZvlT21tFBNqLW52S8gAC/Dvkl+IRmT6lP
         TVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756707669; x=1757312469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM0VzPvZOoadSqld8QAB06APoe2QVLiP88e6xJF3DNg=;
        b=F1HwMv8lQ2yQnF6eTQ70xaC8gUR9uf+3Xspf/T1U3Gw5PEP3PT9YhFYPCA4uSxs7jx
         eQ4/xRjYhosTD1/gTa6QWK7GZlJ+aXCN1EFaB7Mjj/FfOpPD80xiKoUOdhKk+a6yfMEp
         VR4mZHYaTmLKQTtRCr0Y/NsW7QpsKUzziG6SbLIfouBoVzgKSGI9BLU3ZCRyWHhCn+JY
         lI0T/c/oXG7EDIltTQm514F9CSwlnNH2PSIummBCyvdVfz42EPPilo/ZWzNYL1exVCKj
         EbDF8S1FytXveeTfn3s37yMgapG0ugJVSUi0PHNeHdou225zkGIduW5rd6dP/4YLiEkH
         93rg==
X-Forwarded-Encrypted: i=1; AJvYcCWZcews8I635pd45mEzBCsUEfVQF6yNZvBaDvz9p+qcb/mc9zCslUYx9qhbfWhhP/Wwn1tk7YQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/mdI73dDdMWcs+llRxgfTYKNkP5CX0u8thnE7tfXtf7iWIolk
	JqcmaLbo/B7LCKiAYZN0+rhobc0ERvWLwlvYEPqPrg6uqLgn9CVICrz8
X-Gm-Gg: ASbGncu3Q7YvKOH2KthIxGL4WqWTDAb13vK3wFllM5UpL/kFcEMLP9WNtoytg6RFclx
	Dvr++Mt+9EoXKDj9wvWEzX39ncmNH0NgKFcjEBXxj+uHAO3oQc8oBeSfVEfj6gu7tKmWiEUBpuC
	KOhOqdjFjfUjerm4Ge8JAQ+eDZEP3BpsHE9LgsZVX511RWOpaNo5uPIlv+XqMzuJ+zqYQD1e5Pk
	8xBrMXWstGBCLLm/+tjtrJjSrzagEbcfKcaiGERQzvdFpByZcJkyN66n98k0PXmwQzIN4eYdcE9
	YZb70D0Og3I9z8BpJaMlpBjTZ8M6jrnqm8+ugnTELj9NdgJQ1lpHQER8Mrx9IqnQiVpvWr9JaBu
	Td69RmkkBIZB4PLDmTrcEaVCt3k7gdgcf
X-Google-Smtp-Source: AGHT+IE9RouoLA3mI1WTQ5bC8+3a6e/YddQasaUm/tDoSV5izF+qFjCdAOy/vlAmLw+ht6FR6TIR+g==
X-Received: by 2002:a17:903:2347:b0:24a:8d5e:932 with SMTP id d9443c01a7336-24a8d5e0c28mr78375115ad.23.1756707668708;
        Sun, 31 Aug 2025 23:21:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24903727488sm93506135ad.43.2025.08.31.23.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:21:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/4] Add SPI NOR DTS node for SG2042 SoC and boards using it
Date: Mon,  1 Sep 2025 14:20:57 +0800
Message-ID: <175670760972.211032.6732897578408758943.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 13 Aug 2025 16:33:16 +0800, Zixian Zeng wrote:
> [PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
> [PATCH v4 4/4] without content changes.
> 
> Link: https://lore.kernel.org/linux-riscv/20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com/ [1]
> 
> 

Applied to dt/riscv, thanks!

[1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
      https://github.com/sophgo/linux/commit/268b9620d86ef002b5e94355e80c44bbbdc736f0
[2/4] riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      https://github.com/sophgo/linux/commit/6baf562e0474b2885405cc8e383a59269807338d
[3/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      https://github.com/sophgo/linux/commit/2ea345ad682e2ab89c4360bdf90fd170612b3be9
[4/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2
      https://github.com/sophgo/linux/commit/0bf26eecdd2a6d243a3a19d3ea0df10437ed33c7

Thanks,
Inochi

