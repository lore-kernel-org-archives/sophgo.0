Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE071F5F6
	for <sophgo@lists.linux.dev>; Wed,  7 May 2025 00:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578494; cv=none; b=B+1JQ3ys97fXnaNcHeudELteI5uEseH3bkT2BjyhITHOHcJXkRJixG759gleJHLryaCUeKfJYMkzTmsOj7g1YuNKlHWm0WFdMaS1NeaflDQHx4Ae7gqAxJf4dN6JVjVR276uNLYUL1UIGqxWFKE3z8335TVYeLAA41UUZeaUBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578494; c=relaxed/simple;
	bh=548Ai+V2mwoJ45UgqwGrbboTIZXoY4ulmIfeHhWTZvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzaAoIsRL9RKY/CVKcDHwNHxTt5LR6Z1t0VbZohrIvhlv95PL70jZgdZep8lPJY7PsfXmeohxtQ2nFtqTnw1P668PfhUWQow2n0kNNCykKRfs9seUdTroI63SNqius6BoOGk5C6XtA82jdHJgfGFJpIS1vROVm1eDUM0QSoubx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/cgXjmq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/cgXjmq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0ad744811so53672026d6.1
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746578492; x=1747183292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs0cbHUy/X1CPc3qXeHo09wKGdN2bsQRYveDoPtibro=;
        b=U/cgXjmqKmqieOiMqOh4StbgJL7TK5HVAZdYPPd5Z9qD2Eiazjr2OfVS9GI7f6s2pF
         DQtBAiQ6jFUz9xU1A/KIKrwanAiroSzUbuA5Yvo85L1THCEopcRwFiBDIdUunFzYGPoP
         Tin8yWQexZsi8qSfJCjZg2Pfegjf/qWljT9B9fweb8diTQg+/CKzu+VETOvozqky+7S8
         WE5tWsdJqaPBQXXzdneyRMqwvvl7r5eCoe1KkGhNyMoNNTOLp9cGEIGjOTkdTnuwhUy0
         aKmkP/YzC86w6nSTIIpu4BVUDDLhat6x/Pnf97w9XofmJ1sq1H4vrviukbpI3+8p1L1Q
         NRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746578492; x=1747183292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs0cbHUy/X1CPc3qXeHo09wKGdN2bsQRYveDoPtibro=;
        b=CtOWjeL4L3PiZwZ12mKlCr7QdBuyt0NMfpVJH2VvJdBpru5DT7CMTnhlBReNgCiq8G
         vMAYi9M6TNOYYwbDfCN/PMv8C9F2fcuEi27RjtlZ8asSd80jooRY4f+iSgBhW2nL5UN+
         lT26D0uqGGGfnW2hV7sX4wkxU/9E8ZHZX4e9zA3ecDghxUrn2aQ094/yJZqi8LE77N4S
         rMDCvnmLJjHniHEhLjwZGV7rS0HQIjJuVFcT2KgY+1QjvydvSor9I760Id+6uihWromf
         oNuhn1VEFlGnqEINM6WgT3w3pZfv4HM6fJNO1VsUaxvzZwqJAL/xmrWwyukUJsxDr5PD
         4yiQ==
X-Gm-Message-State: AOJu0YzOrSbhA5B3AyrX7gxcLHVCjeO4F2aG+YqKWjkJ/zZoNssZW90t
	moRypSKs8MlEUnF6Gx3dRMKyzzcg5viFnkVKZ2+TfglvgoLpmDb6dbprTQ==
X-Gm-Gg: ASbGncvjqacl+kBj5hiWKdIGl2LRZYWEbST/2d3PB+Ey3+2lV3/BWYcTaQWB7aCSWC7
	IGmwCcBhYaKBI83oH5gRPQMRz2+kVVVGJnPhUl++VOCujftjv5fhLTLZoZ36NgqHZFkBehWA5Z4
	lFuya/ZiderF0aYyY5yThahZAPMDhxRvPegkTvbX8wWa80xLtTgPf2BxT/5IWEmyCEjY5etoXCA
	s0WpxgSdqLzaYCc/8Lo6UDxdkoMs6jmhg89T/aQEGK0jhDcNy8XUu+jVBjTebbxxxH3l9IsIf+Y
	P3TkRPkQuVl5Ksfb
X-Google-Smtp-Source: AGHT+IGVZ/pnRC0a6W8UhFRw6PLxdQ3rmQAvSYapKUv6I9ZAERpmmy7XYBPDgVEEHyeyj6Svq20t2w==
X-Received: by 2002:a05:6214:5285:b0:6f4:c237:9709 with SMTP id 6a1803df08f44-6f542a4f69amr20264566d6.25.1746578491730;
        Tue, 06 May 2025 17:41:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f5427813f7sm4965586d6.71.2025.05.06.17.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:41:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v14 0/3] rtc: sophgo: add rtc support for CV1800
Date: Wed,  7 May 2025 08:41:05 +0800
Message-ID: <174657845776.270439.14182272430991202072.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 15 Mar 2025 23:49:11 +0100, Alexander Sverdlin wrote:
> Real Time Clock (RTC) is an independently powered module within the chip,
> which includes a 32KHz oscillator and a Power On Reset/POR submodule. It
> can be used for time display and timed alarm generation.
> 
> This series aims to provide complete DT bindings, but the drivers are only
> focusing on RTC implementation. Possible Power Management and remoteproc
> can be implemented later (hence the RTC driver is using syscon, because
> MMIO space is really interleaved among different functions).
> 
> [...]

Applied to soc-for-next, thanks!

[1/3] dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
      https://github.com/sophgo/linux/commit/76517429dbfd8eca16fe85482cdb8024bbbd06bd
[2/3] soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)
      https://github.com/sophgo/linux/commit/c8754c7deab4cbfa947fa2d656cbaf83771828ef

Thanks,
Inochi

