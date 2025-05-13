Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0A91E00B4
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109955; cv=none; b=AomUbhwmkLCHDspCyl6LAtf+vTNoFE4B9iY7NtOTB2tRdRwkTNs4ceW4/ae864yVkTCAYDA9+iN+MPrRqSnlD5jslUh5ty2/xyFRvSxUqa89Short+gvYY3VXu5TsQRHp0AGy9mQD5yKd57lWfZjGFftp5Zn893/+Cc5pxD0gPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109955; c=relaxed/simple;
	bh=kGZWRZOeRSkQaw367SMSl+gSUcwpGB0B3nI9lZI6dg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PwILDaYn6DqJhxrIcVzimqkVN93yV16z4sAC+ijh6GIYD+1sNtRX9259v3GBHyW+6elmMHqV3nYQM3A8+D9WNV9KRt9QxB2XPX7L9xPkSVquFH41vDlygb7KRdPLVsv5SYikelBaNT1JQ9PQWp3TYX7skEtuJYGZjv6X0XFaOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc6OJUy+; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc6OJUy+"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47691d82bfbso94505371cf.0
        for <sophgo@lists.linux.dev>; Mon, 12 May 2025 21:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109953; x=1747714753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFbsTQE9tHKiV3IKABKjWIYDMs9C+L7n7mu7OXh8b2s=;
        b=Kc6OJUy+H7RDhyT0m5x/ZcaWq0VEXb5z19A1jBStZxWehs/+47oG2EpkuPLB+saX82
         +3VpvVBOCMw4O6jw4EYafhqI6vi98TbADd9/6Ev/bxpzxK4SRMxT3iKV2wwVaIsUypD9
         auRd/zSduOfUiwcBcriigUGxxVHbv116e17p+6D5nWqUKDH/PGXOG7jmNNR96codwJkE
         h81bK5s+aPlwGTd77bv+NcFZwE+IHMXz6MYqKOsV8T34IBLyr9JzyKSBvbTWoF71+4WB
         miNYUa+Jc95Rg1kcXfW0OEL06CiAbBLt+bLX+hXc0sZV6YIFrwgUHVLGl49hvDRezam9
         jGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109953; x=1747714753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFbsTQE9tHKiV3IKABKjWIYDMs9C+L7n7mu7OXh8b2s=;
        b=Bt4KzRdZAZUdhfgGT5XQMw8lhqCYyP2kPLRBjlKyymWFXUqvgDXSHjjoT1qhb6/Ghx
         g4XhNY6dMy4lNcQlWEVMeLIjiKdSRapAH8MA7l0rEPmQXQ6fqiZTCYX0GNo4EhhMiqOG
         8EObweUUgilh5Rvha6b932m8Kgku2TRCq6WcmGITZCvh5HEgMYp4tX9/CKDkNJgg4dQC
         UY+VSH9XKzSAbqOH5lsN7olDBkFW+7nzA6Bw61pGWokGt84gq939rwa33GcgOTShL/4h
         +SSLVvlZIucnw5BONgG52Rxb6MUyuERUq4+8qHqTqZJfHph1UCBAX11dRcL+vBV1mX3a
         lJOg==
X-Forwarded-Encrypted: i=1; AJvYcCWAWHQFJ0dsPWlICrTwPmSd6pNRwZN/070l93JojCztReWNQRpkpYbbSLNFBS/ilSVQS5egv18=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJnSo8BUPheRoB0Bbd290ok9AE/FiR53QX6t/E7cSJEQee5QVk
	feGWBUQjqtCgNFDLSBXGr83VDJZQPIFxcR4B2sOwLe42k3ej9vN5
X-Gm-Gg: ASbGncsLg5ierXg1YHdTUfha59MWWHHzmsY09EquXTwV45PUpUhYUHkP2mpQZgjNxqt
	zNOtSJrB32qxINK7kR2OzJgzWD4aQm+Egd+x2HuIivtZ4xipu+uSjSnY0Hjp0ChpggvooJ+M3A+
	4d/ET1tTF2jDwC1VqpX0x8GN2TM/Gx/aTF54AU0mfEc+znNaXX3v68iDqfJWaa71A7H54XEs/g8
	PTubd43md3BcOtjhUGhxua1QR4mPqUcqCJY2nvliv5HWcaqT70lhcePOiSCAFFUaEJgM3AQbOfY
	lB/kIMCXifprQv++meA7RvR4xBcZ05/9dkirJQ==
X-Google-Smtp-Source: AGHT+IGS3DH141eF3XFbywTS59BbLhX/9gyOryljRpt7OKQZ/4+tNhx00bLdZ/bOFxGP5J/MjBr5Cg==
X-Received: by 2002:a05:620a:1b88:b0:7c5:ad99:9e38 with SMTP id af79cd13be357-7cd01143dd6mr2694467085a.43.1747109952721;
        Mon, 12 May 2025 21:19:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe620csm645540485a.97.2025.05.12.21.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:19:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Tue, 13 May 2025 12:18:23 +0800
Message-ID: <174710989166.597941.2836952647121868068.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 04 May 2025 18:45:49 +0800, Inochi Amaoto wrote:
> The part 2 of dts rework replaces precise compatible for existed clock device
> with old wildcard one.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
> 1. patch 1: reused sophgo,sg2000-clk for sg2002.
> 2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
>             commit message.
> 3. patch 2: fix wrong data for sophgo,cv1812h-clk.
> 4. patch 2: remove compatible sophgo,sg2002-clk.
> 5. patch 3: adapt the change of patch 1,2.
> 
> [...]

Applied to for-next, thanks!

[3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
      https://github.com/sophgo/linux/commit/6493272ec02706dcb2a32a1c7b14e47432ce6d6a

Thanks,
Inochi

